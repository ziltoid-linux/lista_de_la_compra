import 'package:flutter/material.dart';
import 'package:lista_de_la_compra/UI/common/needed_checkbox.dart';
import 'package:lista_de_la_compra/UI/common/searchable_list_view.dart';
import 'package:lista_de_la_compra/UI/products/product_detail.dart';
import 'package:lista_de_la_compra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../flutter_providers/flutter_providers.dart';

import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

class ProductListDisplay extends StatelessWidget {
  final List<Product> products;
  final bool isNeededList;
  final String enviromentId;
  final List<String> selectedHouseIds;

  const ProductListDisplay(
    this.products,
    this.isNeededList,
    this.enviromentId,
    this.selectedHouseIds, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider = context.watch<FlutterProductProvider>();
    final NeededProductProvider neededProductProvider = context.watch<FlutterNeededProductProvider>();
    final HouseProvider houseProvider = context.watch<FlutterHouseProvider>();
    final AppLocalizations appLoc = AppLocalizations.of(context)!;

    return FutureBuilder<List<House>>(
      future: houseProvider.getHouseList(enviromentId),
      builder: (context, houseSnapshot) {
        final allHouses = houseSnapshot.data ?? <House>[];
        final selectedHouses = allHouses.where((h) => selectedHouseIds.contains(h.id)).toList();

        return FutureBuilder<Set<String>>(
          future: neededProductProvider.getNeededProductIds(enviromentId, selectedHouseIds),
          builder: (context, neededSnapshot) {
            final neededProductIds = neededSnapshot.data ?? <String>{};

            final displayProducts = isNeededList
                ? products.where((p) => neededProductIds.contains(p.id)).toList()
                : products;

            return Searchablelistview<Product>(
              elements: displayProducts,
              elementsOnSearch: products,
              elementToListTile: (Product p, RichText tag) {
                return ListTile(
                  title: tag,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (selectedHouseIds.isNotEmpty)
                        ...selectedHouses.map((house) {
                          return NeededCheckbox(
                            productId: p.id,
                            houseId: house.id,
                            delay: isNeededList ? Duration(milliseconds: 200) : null,
                          );
                        }),
                      if (selectedHouseIds.isEmpty)
                        Text(appLoc.noHouseSelected),
                      IconButton(
                        icon: const Icon(Icons.arrow_outward),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(p.id, enviromentId),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              elementToTag: (Product p) => p.name,
              newElement: (String name) async {
                final allProducts = await productProvider.getDisplayProductList(enviromentId);
                final existing = allProducts.where(
                  (e) => e.name.toLowerCase() == name.toLowerCase(),
                );

                if (existing.isNotEmpty) {
                  final referenced = existing.first;
                  for (final houseId in selectedHouseIds) {
                    neededProductProvider.setNeeded(houseId, referenced.id, true);
                  }
                } else {
                  final newId = await productProvider.addProduct(name, enviromentId);
                  for (final houseId in selectedHouseIds) {
                    neededProductProvider.setNeeded(houseId, newId, true);
                  }
                }
              },
            );
          },
        );
      },
    );
  }
}
