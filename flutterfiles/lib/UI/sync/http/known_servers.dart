import 'package:flutter/material.dart';
import 'package:lista_de_la_compra/l10n/app_localizations.dart';
import 'package:lista_de_la_compra/sync/http_client_service.dart';
import 'package:provider/provider.dart';
import '../../../flutter_providers/flutter_providers.dart';
import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

class HTTPKnownServers extends StatelessWidget {
  const HTTPKnownServers({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterHttpClientService httpClientService = context.watch<FlutterHttpClientService>();
    final AppLocalizations appLoc = AppLocalizations.of(context)!;
    final FlutterHttpServerProvider httpServerProvider = context.watch<FlutterHttpServerProvider>();
    final FlutterOpenConnectionProvider openConnectionProvider = context.watch<FlutterOpenConnectionProvider>();

    return FutureBuilder<List<dynamic>>(
      future: httpServerProvider.getHttpServers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text(appLoc.loading);

        final List<dynamic> servers = snapshot.data!;
        if (servers.isEmpty) return Center(child: Text(appLoc.noHTTPPairings));

        return Column(
          children: servers.map<Widget>((dynamic server) {
            Widget stateIcon = const Icon(Icons.link_off);
            if (httpClientService.runningAttempts.contains(server.id)) {
              stateIcon = const Icon(Icons.hourglass_top);
            }
            if (openConnectionProvider.anyOpenConnectionOfSource(server.id)) {
              stateIcon = const Icon(Icons.link);
            }

            return ListTile(
              title: Text(server.httpHost),
              subtitle: Text(server.nick ?? appLoc.neverConnected),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  stateIcon,
                  IconButton(
                    onPressed: () {
                      openConnectionProvider.closeByConnectionSource(server.id);
                      httpServerProvider.deleteHttpServer(server.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
