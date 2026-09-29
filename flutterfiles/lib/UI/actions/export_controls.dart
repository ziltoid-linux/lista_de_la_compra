import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_la_compra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../flutter_providers/flutter_providers.dart';

import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

// ignore: must_be_immutable
class ExporControls extends StatelessWidget {
  String enviromentId;

  ExporControls(this.enviromentId, {super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLoc = AppLocalizations.of(context)!;
    EnvironmentProvider environmentProvider = context.watch<FlutterEnvironmentProvider>();
    ProductProvider productProvider = context.watch<FlutterProductProvider>();
    HouseProvider houseProvider = context.watch<FlutterHouseProvider>();
    NeededProductProvider neededProductProvider = context.watch<FlutterNeededProductProvider>();

    final Future serialized = serializeGroceryListEnvironment(
      enviromentId,
      environmentProvider,
      productProvider,
      houseProvider,
      neededProductProvider,
    );
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final Future fileName = environmentProvider
        .getEnvironmentById(enviromentId)
        .then((Environment? env) => "${(env?.name) ?? appLoc.error}_${formatter.format(now)}_export.json");

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () async {
              FilePicker.saveFile(
                dialogTitle: appLoc.saveFileToYourDesiredLocation,
                fileName: await fileName,
                bytes: utf8.encode(jsonEncode(await serialized)),
              );
            },
            child: Row(children: [Icon(Icons.download), SizedBox(width: 8), Text(appLoc.exportToFile)]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () async {
              await SharePlus.instance.share(
                ShareParams(
                  files: [
                    XFile.fromData(
                      utf8.encode(jsonEncode(await serialized)),
                      // name: fileName, // Notice, how setting the name here does not work.
                      mimeType: 'text/plain',
                    ),
                  ],
                  fileNameOverrides: [await fileName],
                  downloadFallbackEnabled: true,
                ),
              );
            },
            child: Row(children: [Icon(Icons.share), SizedBox(width: 8), Text(appLoc.sendExport)]),
          ),
        ),
      ],
    );
  }
}

Future<Map<String, dynamic>> serializeGroceryListEnvironment(
  String enviromentId,
  EnvironmentProvider environmentProvider,
  ProductProvider productProvider,
  HouseProvider houseProvider,
  NeededProductProvider neededProductProvider,
) async {
  final environment = (await environmentProvider.getEnvironmentById(enviromentId))!;
  final products = await productProvider.getSyncProductList(enviromentId);
  final houses = await houseProvider.getSyncHouseList(enviromentId);
  final neededProducts = await neededProductProvider.getSyncNeededProductList(enviromentId);

  return {
    "environment": environment.toJson(),
    "products": products.map((product) => product.toJson()).toList(),
    "houses": houses.map((house) => house.toJson()).toList(),
    "needed_products": neededProducts.map((neededProduct) => neededProduct.toJson()).toList(),
  };
}
