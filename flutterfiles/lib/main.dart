import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_show_when_locked/flutter_show_when_locked.dart';
import 'package:lista_de_la_compra/UI/selected_environment_fork.dart';
import 'package:lista_de_la_compra/shared_preference_providers/persistant_shared_preferences_provider.dart';
import 'package:lista_de_la_compra/shared_preference_providers/persistent_selected_houses_provider.dart';
import 'package:lista_de_la_compra/sync/http_client_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'flutter_providers/flutter_providers.dart';
import 'l10n/app_localizations.dart';

import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDatabaseSingleton.setQueryExecutor(
      driftDatabase(
        name: 'persistence',
        web: DriftWebOptions(sqlite3Wasm: Uri.parse("sqlite3.wasm"), driftWorker: Uri.parse("drift_worker.js")),
        native: DriftNativeOptions(
          databaseDirectory: () async {
            try {
              return await getApplicationDocumentsDirectory();
            } catch (err) {
              return "./lista_de_la_compra/db/";
            }
          },
          tempDirectoryPath: () async {
            try {
              return await getTemporaryDirectory().then((d) => d.path);
            } catch (err) {
              return "./lista_de_la_compra/tmp/";
            }
          },
        ),
      ),
    );

    final FlutterEnvironmentProvider environmentProvider = FlutterEnvironmentProvider();
    final FlutterProductProvider productProvider = FlutterProductProvider();
    final FlutterHttpServerProvider httpServerProvider = FlutterHttpServerProvider();
    final FlutterOpenConnectionProvider openConnectionProvider = FlutterOpenConnectionProvider();
    final FlutterHouseProvider houseProvider = FlutterHouseProvider();
    final FlutterNeededProductProvider neededProductProvider = FlutterNeededProductProvider();

    final PersistantSharedPreferencesProvider sharedPreferencesProvider = PersistantSharedPreferencesProvider(context);
    final PersistentSelectedHousesProvider selectedHousesProvider = PersistentSelectedHousesProvider();

    final OpenConnectionManager openConnectionManager = OpenConnectionManager(
      openConnectionProvider,
      productProvider,
      environmentProvider,
      houseProvider,
      neededProductProvider,
      sharedPreferencesProvider,
    );

    final HttpServerManager httpServerManager = HttpServerManager(httpServerProvider, openConnectionManager);
    final FlutterHttpClientService httpClientService = FlutterHttpClientService(openConnectionProvider, openConnectionManager, httpServerProvider);

    final FlutterHttpServerStateProvider httpServerStateProvider = FlutterHttpServerStateProvider(httpServerManager, sharedPreferencesProvider);

    (() async {
      httpServerStateProvider.tryStartServer();
    })();

    AppLifecycleListener(
      onShow: () {
        FlutterShowWhenLocked().show();
      },
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => environmentProvider),
        ChangeNotifierProvider(create: (_) => productProvider),
        ChangeNotifierProvider(create: (_) => httpServerProvider),
        ChangeNotifierProvider(create: (_) => openConnectionProvider),
        ChangeNotifierProvider(create: (_) => httpServerStateProvider),
        ChangeNotifierProvider(create: (_) => httpClientService),
        ChangeNotifierProvider(create: (_) => houseProvider),
        ChangeNotifierProvider(create: (_) => neededProductProvider),
        ChangeNotifierProvider(create: (_) => sharedPreferencesProvider),
        ChangeNotifierProvider(create: (_) => selectedHousesProvider),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) {
          AppLocalizations appLoc = AppLocalizations.of(context)!;
          return appLoc.appTitle;
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(220, 138, 221, 1), brightness: MediaQuery.platformBrightnessOf(context)),
        ),
        home: SelectedEnvironmentFork(openConnectionManager),
      ),
    );
  }
}

class NativeDatabase {}
