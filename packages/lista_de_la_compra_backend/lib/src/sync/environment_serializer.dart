import 'package:lista_de_la_compra_backend/src/db/database.dart';

import '../db_providers/environment_provider.dart';
import '../db_providers/house_provider.dart';
import '../db_providers/needed_product_provider.dart';
import '../db_providers/product_provider.dart';

Future<Map<String, dynamic>> serializeEnvironment(
  String enviromentId,
  EnvironmentProvider environmentProvider,
  ProductProvider productProvider,
  HouseProvider houseProvider,
  NeededProductProvider neededProductProvider,
) async {
  final environment = await environmentProvider.getEnvironmentById(enviromentId);
  if (environment == null) {
    throw StateError('Environment not found: $enviromentId');
  }

  return {
    "environment": environment,
    "products": await productProvider.getSyncProductList(enviromentId),
    "houses": await houseProvider.getSyncHouseList(enviromentId),
    "needed_products": await neededProductProvider.getSyncNeededProductList(enviromentId),
  };
}

Future<void> syncItems(
  List<dynamic> otherItems,
  List<dynamic> selfItems,
  Function(String, Map<String, dynamic>) syncOverrideCallback,
  Function(String, int) syncSetDeletedCallback,
  Function(Map<String, dynamic>) syncAddCallback,
) async {
  final selfById = {for (final item in selfItems) item.id: item};

  for (final otherItem in otherItems) {
    final selfItem = selfById[otherItem["id"]];

    if (selfItem == null) {
      await syncAddCallback(otherItem);
      continue;
    }

    if (selfItem.deletedAt == null && otherItem["deletedAt"] == null) {
      if (selfItem.updatedAt < otherItem["updatedAt"]) {
        await syncOverrideCallback(selfItem.id, otherItem);
      }
    }

    if (otherItem["deletedAt"] != null) {
      if (selfItem.deletedAt == null || selfItem.deletedAt > otherItem["deletedAt"]) {
        await syncSetDeletedCallback(selfItem.id, otherItem["deletedAt"]);
      }
    }
  }
}

Future<void> recieveState(
  Map<String, dynamic> state,
  EnvironmentProvider environmentProvider,
  ProductProvider productProvider,
  HouseProvider houseProvider,
  NeededProductProvider neededProductProvider,
) async {
  final remoteEnvironment = Environment.fromJson(state["environment"]);
  final currentEnvironment =
      await environmentProvider.getEnvironmentById(remoteEnvironment.id);

  if (currentEnvironment == null) {
    return;
  }

  if (currentEnvironment.updatedAt < remoteEnvironment.updatedAt &&
      currentEnvironment.name != remoteEnvironment.name) {
    await environmentProvider.setName(
      currentEnvironment.id,
      remoteEnvironment.name,
    );
  }

  final otherProducts = (state["products"] ?? []) as List<dynamic>;
  final otherHouses = (state["houses"] ?? []) as List<dynamic>;
  final otherNeededProducts = (state["needed_products"] ?? []) as List<dynamic>;

  await syncItems(
    otherProducts,
    await productProvider.getSyncProductList(remoteEnvironment.id),
    (id, item) => productProvider.syncOveride(id, item),
    (id, deletedAt) => productProvider.syncSetDeleted(id, deletedAt),
    (item) => productProvider.syncAddProduct(item),
  );

  await syncItems(
    otherHouses,
    await houseProvider.getSyncHouseList(remoteEnvironment.id),
    (id, item) => houseProvider.syncOveride(id, item),
    (id, deletedAt) => houseProvider.syncSetDeleted(id, deletedAt),
    (item) => houseProvider.syncAddHouse(item),
  );

  await syncItems(
    otherNeededProducts,
    await neededProductProvider.getSyncNeededProductList(remoteEnvironment.id),
    (id, item) => neededProductProvider.syncOveride(id, item),
    (id, deletedAt) => neededProductProvider.syncSetDeleted(id, deletedAt),
    (item) => neededProductProvider.syncAddNeededProduct(item),
  );
}
