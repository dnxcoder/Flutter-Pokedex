import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/data/notifiers.dart';
import 'package:flutter_pokedex/views/pages/favorites_page.dart';
import 'package:flutter_pokedex/views/pages/home_page.dart';
import 'package:flutter_pokedex/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), FavoritesPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex")),
      body: ValueListenableBuilder(
        valueListenable: selectedTabNotifier,
        builder: (context, selectedTab, child) {
          return pages[selectedTab];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
