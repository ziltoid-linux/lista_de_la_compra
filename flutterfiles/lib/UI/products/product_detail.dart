import 'package:flutter/material.dart';
import 'package:lista_de_la_compra/UI/common/needed_checkbox.dart';
import 'package:lista_de_la_compra/UI/products/product_home.dart';
import 'package:lista_de_la_compra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../flutter_providers/flutter_providers.dart';

import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

class ProductDetail extends StatelessWidget {
  final String productId;
  final String enviromentId;

  const ProductDetail(this.productId, this.enviromentId, {super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLoc = AppLocalizations.of(context)!;
    final ProductProvider productProvider = context.watch<FlutterProductProvider>();
    final HouseProvider houseProvider = context.watch<FlutterHouseProvider>();

    final productFuture = productProvider.getProductById(productId);
    final housesFuture = houseProvider.getHouseList(enviromentId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ProductHome(enviromentId)),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (s) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(children: [Icon(Icons.delete), SizedBox(width: 8), Text(appLoc.delete)]),
                  onTap: () {
                    Navigator.pop(context);
                    productProvider.deleteProductById(productId);
                  },
                ),
                PopupMenuItem(
                  child: Row(children: [Icon(Icons.edit), SizedBox(width: 8), Text(appLoc.editName)]),
                  onTap: () {
                    final textControler = TextEditingController();
                    productFuture.then((Product? p) {
                      if (p != null) textControler.text = p.name;
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(appLoc.editName),
                          content: TextField(
                            decoration: InputDecoration(labelText: appLoc.name),
                            controller: textControler,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(appLoc.cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                productProvider.setProductName(productId, textControler.text);
                                Navigator.of(context).pop();
                              },
                              child: Text(appLoc.save),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ];
            },
          ),
        ],
        title: FutureBuilder(
          future: productFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) return Text(snapshot.data!.name);
            if (snapshot.hasError) return Text("$snapshot");
            return Text(appLoc.loading);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<House>>(
          future: housesFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();

            return ListView(
              children: [
                Text(appLoc.houses, style: Theme.of(context).textTheme.titleSmall),
                ...snapshot.data!.map(
                  (house) => ListTile(
                    title: Text(house.name),
                    trailing: NeededCheckbox(
                      productId: productId,
                      houseId: house.id,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
