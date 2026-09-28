import 'package:flutter/material.dart';
import 'package:lista_de_la_compra/UI/actions/action_home.dart';
import 'package:lista_de_la_compra/UI/houses/house_manager.dart';
import 'package:lista_de_la_compra/UI/products/product_home.dart';
import 'package:lista_de_la_compra/l10n/app_localizations.dart';

import 'package:lista_de_la_compra_backend/lista_de_la_compra_backend.dart';

class Home extends StatefulWidget {
  final String enviromentId;
  final OpenConnectionManager openConnectionManager;

  const Home(this.enviromentId, this.openConnectionManager, {super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    ProductHome(widget.enviromentId),
    HouseManager(widget.enviromentId),
    ActionHome(widget.enviromentId, widget.openConnectionManager),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: appLoc.shoppingList,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: appLoc.houses,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: appLoc.actions,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
