
// https://stackoverflow.com/questions/78626240/flutter-drift-for-the-web-unsupported-operation-unsupported-invalid-type-invali
import 'package:drift/backends.dart';
import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';
import 'src/shared_preferences_providers/ram_shared_preferences_provider.dart';

import 'src/sqlite_db/sqlite_db.dart';


Future main() async {
  runServer();
}

Future runServer() async {
  QueryExecutor executor = createUnderlyingDatabaseConnection();
  AppDatabaseSingleton.setQueryExecutor(executor);

  final environmentProvider = RamEnvironmentProvider();
  final productProvider = RamProductProvider();
  final httpServerProvider = RamHttpServerProvider();
  final sharedPreferencesProvider = RamSharedPreferencesProvider();
  final openConnectionProvider = RamOpenConnectionProvider();
  final houseProvider = RamHouseProvider();
  final neededProductProvider = RamNeededProductProvider();

  final OpenConnectionManager openConnectionManager = OpenConnectionManager(
    openConnectionProvider,
    productProvider,
    environmentProvider,
    houseProvider,
    neededProductProvider,
    sharedPreferencesProvider,

    downloadAllEnvironments: true,
  );

  final httpServerManager = HttpServerManager(httpServerProvider, openConnectionManager);

  final httpServerStateProvider = RamHttpServerStateProvider(httpServerManager, sharedPreferencesProvider);

  httpServerStateProvider.tryStartServer();

  while (true) {
    String? err = httpServerStateProvider.getServerError();
    if (err != null) {
      print(err);
      httpServerStateProvider.tryStartServer();
    }

    await Future.delayed(Duration(seconds: 5));
  }
}
