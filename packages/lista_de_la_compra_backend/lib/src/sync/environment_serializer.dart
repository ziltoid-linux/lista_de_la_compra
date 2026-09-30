import '../db/database.dart';
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
  final envFuture = environmentProvider.getEnvironmentById(enviromentId);
  final productsFuture = productProvider.getSyncProductList(enviromentId);
  final housesFuture = houseProvider.getSyncHouseList(enviromentId);
  final neededProductsFuture = neededProductProvider.getSyncNeededProductList(enviromentId);

  final environment = (await envFuture)!;
  final products = await productsFuture;
  final houses = await housesFuture;
  final neededProducts = await neededProductsFuture;

  return {
    "environment": environment,
    "products": products,
    "houses": houses,
    "needed_products": neededProducts,
  };
}

Future<void> syncItems(
  List<dynamic> otherItems,
  List<dynamic> selfItems,
  Function(String, Map<String, dynamic>) syncOverideCallback,
  Function(String, int) syncSetDeletedCallback,
  Function(Map<String, dynamic>) syncAddProductCallback,
) async {
  final selfById = {for (var item in selfItems) item.id: item};

  for (var otherItem in otherItems) {
    final selfItem = selfById[otherItem["id"]];

    if (selfItem == null) {
      syncAddProductCallback(otherItem);
      continue;
    }

    if (selfItem.deletedAt == null && otherItem["deletedAt"] == null) {
      if (selfItem.updatedAt < otherItem["updatedAt"]) {
        syncOverideCallback(selfItem.id, otherItem);
      }
    }

    if (otherItem["deletedAt"] != null) {
      if (selfItem.deletedAt == null || selfItem.deletedAt > otherItem["deletedAt"]) {
        syncSetDeletedCallback(selfItem.id, otherItem["deletedAt"]);
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
  Environment remoteEnvironment = Environment.fromJson(state["environment"]);
  Environment? currentEnvironment = await environmentProvider.getEnvironmentById(remoteEnvironment.id);
  if (currentEnvironment == null) {
    return;
  }

  if (currentEnvironment.updatedAt < remoteEnvironment.updatedAt) {
    if (currentEnvironment.name != remoteEnvironment.name) {
      environmentProvider.setName(currentEnvironment.id, remoteEnvironment.name);
    }
  }

  List<dynamic> otherProducts = state["products"] ?? [];
  List<dynamic> otherHouses = state["houses"] ?? [];
  List<dynamic> otherNeededProducts = state["needed_products"] ?? [];

  var selfProducts = productProvider.getSyncProductList(remoteEnvironment.id);
  var selfHouses = houseProvider.getSyncHouseList(remoteEnvironment.id);
  var selfNeededProducts = neededProductProvider.getSyncNeededProductList(remoteEnvironment.id);

  await syncItems(
    otherProducts,
    await selfProducts,
    (id, item) => productProvider.syncOveride(id, item),
    (id, deletedAt) => productProvider.syncSetDeleted(id, deletedAt),
    (item) => productProvider.syncAddProduct(item),
  );

  await syncItems(
    otherHouses,
    await selfHouses,
    (id, item) => houseProvider.syncOveride(id, item),
    (id, deletedAt) => houseProvider.syncSetDeleted(id, deletedAt),
    (item) => houseProvider.syncAddHouse(item),
  );

  await syncItems(
    otherNeededProducts,
    await selfNeededProducts,
    (id, item) => neededProductProvider.syncOveride(id, item),
    (id, deletedAt) => neededProductProvider.syncSetDeleted(id, deletedAt),
    (item) => neededProductProvider.syncAddNeededProduct(item),
  );
}
