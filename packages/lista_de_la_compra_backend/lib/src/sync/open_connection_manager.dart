import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../lista_de_la_compra_backend.dart';

class OpenConnectionManager {
  final ProductProvider productProvider;
  final OpenConnectionProvider openConnectionProvider;
  final SharedPreferencesProvider sharedPreferencesProvider;
  final EnvironmentProvider environmentProvider;
  final HouseProvider houseProvider;
  final NeededProductProvider neededProductProvider;

  final bool downloadAllEnvironments;

  OpenConnectionManager(
    this.openConnectionProvider,
    this.productProvider,
    this.environmentProvider,
    this.houseProvider,
    this.neededProductProvider,
    this.sharedPreferencesProvider, {
    this.downloadAllEnvironments = false,
  }) {
    productProvider.addListener(triggerSyncPush);
    environmentProvider.addListener(triggerHandshakePush);
    houseProvider.addListener(triggerSyncPush);
    neededProductProvider.addListener(triggerSyncPush);
    sharedPreferencesProvider.addListener(triggerHandshakePush);
  }

  void triggerSyncPull() {
    for (final connection in openConnectionProvider.openConnections.values) {
      connection.triggerSyncPull();
    }
  }

  void triggerSyncPush() {
    for (final connection in openConnectionProvider.openConnections.values) {
      connection.triggerSyncPush();
    }
  }

  void triggerHandshakePush() {
    for (final connection in openConnectionProvider.openConnections.values) {
      connection.triggerHandshakePush();
    }
  }

  Future<String> getStateDigest(int salt, String enviromentId) async {
    final bytes = utf8.encode(
      jsonEncode(
        await serializeEnvironment(
          enviromentId,
          environmentProvider,
          productProvider,
          houseProvider,
          neededProductProvider,
        ),
      ),
    );
    return sha512256.convert(bytes + utf8.encode(salt.toString())).toString();
  }

  Future<Map<String, dynamic>> getHandshake() async {
    return {
      "type": "handshake",
      "id": await sharedPreferencesProvider.getTerminalId(),
      "nick": await sharedPreferencesProvider.getLocalNick(),
      "env_list": await environmentProvider.getEnvironmentList(),
    };
  }

  void socketManage(
    WebSocketChannel ws,
    String? connectionSourceId,
    String userNote, {
    Function(String)? afterHandshakeNickCb,
    Function? abortCb,
  }) async {
    String? terminalId;
    String? openConnectionId;
    String? nick;

    void send(dynamic message) => ws.sink.add(message);

    Future<void> triggerSyncPull() async {
      for (final env in await environmentProvider.getEnvironmentList()) {
        if (!env.id.contains("noSync")) {
          final salt = math.Random().nextInt(1000);
          send(jsonEncode({
            "type": "send_digest",
            "salt": salt,
            "environment": env,
            "digest": await getStateDigest(salt, env.id),
          }));
        }
      }
    }

    Timer? responsivenessTimeout;

    void checkResponsiveness() {
      responsivenessTimeout?.cancel();
      responsivenessTimeout = Timer(
        const Duration(seconds: 10),
        () => ws.sink.close(),
      );
      send(jsonEncode({
        "type": "ping",
        "nonce": math.Random().nextInt(1000),
        "ping_t": DateTime.now().millisecondsSinceEpoch,
      }));
    }

    ws.stream.listen((message) async {
      if (message is! String) return;
      final data = jsonDecode(message);

      switch (data["type"]) {
        case "ping":
          send(jsonEncode({
            "type": "pong",
            "nonce": data["nonce"],
            "ping_t": data["ping_t"],
            "pong_t": DateTime.now().millisecondsSinceEpoch,
          }));
          break;
        case "pong":
          responsivenessTimeout?.cancel();
          responsivenessTimeout = Timer(const Duration(seconds: 1), checkResponsiveness);
          final latency = DateTime.now().millisecondsSinceEpoch - data["ping_t"];
          if (terminalId != null && openConnectionId != null) {
            openConnectionProvider.setLatency(openConnectionId!, latency);
          }
          break;
        case "handshake":
          terminalId = data["id"];
          nick = data["nick"];
          if (afterHandshakeNickCb != null && nick != null) {
            afterHandshakeNickCb(nick!);
          }

          final envList = <Environment>[
            for (final jsonEnv in data["env_list"]) Environment.fromJson(jsonEnv),
          ];

          if (openConnectionId == null) {
            openConnectionId = openConnectionProvider.addOpenConnection(
              terminalId!,
              connectionSourceId,
              nick!,
              () async => triggerSyncPull(),
              () => send(jsonEncode({"type": "sync_push"})),
              () async => send(jsonEncode(await getHandshake())),
              () => ws.sink.close(4001, "Erased Peer"),
              envList,
              userNote,
            );
          } else {
            openConnectionProvider.setNick(openConnectionId!, nick!);
          }

          if (downloadAllEnvironments) {
            for (final env in envList) {
              await environmentProvider.upsertEnvironment(env);
            }
          }

          await triggerSyncPull();
          responsivenessTimeout?.cancel();
          checkResponsiveness();
          break;
        case "sync_push":
          await triggerSyncPull();
          break;
        case "send_digest":
          if (data["environment"] == null) break;

          final remoteEnvironment = Environment.fromJson(data["environment"]);
          final currentEnvironment =
              await environmentProvider.getEnvironmentById(remoteEnvironment.id);
          if (currentEnvironment == null) break;

          if (currentEnvironment.updatedAt < remoteEnvironment.updatedAt &&
              currentEnvironment.name != remoteEnvironment.name) {
            await environmentProvider.setName(
              currentEnvironment.id,
              remoteEnvironment.name,
            );
          }

          final ownDigest =
              await getStateDigest(data["salt"], remoteEnvironment.id);

          if (data["digest"] == ownDigest) {
            send(jsonEncode({"type": "sync_up_to_date"}));
          } else {
            send(jsonEncode({
              "type": "send_state",
              "state": await serializeEnvironment(
                remoteEnvironment.id,
                environmentProvider,
                productProvider,
                houseProvider,
                neededProductProvider,
              ),
            }));
          }
          break;
        case "send_state":
          await recieveState(
            data["state"],
            environmentProvider,
            productProvider,
            houseProvider,
            neededProductProvider,
          );
          break;
        case "sync_up_to_date":
          break;
      }
    }, onDone: () {
      responsivenessTimeout?.cancel();
      if (openConnectionId != null) {
        openConnectionProvider.removeOpenConnection(openConnectionId!);
      }
    });

    send(jsonEncode(await getHandshake()));
  }
}
