import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: selectedTabNotifier,
      builder: (context, selectedTab, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          onDestinationSelected: (int value) {
            selectedTabNotifier.value = value;
          },
          selectedIndex: selectedTab,
        );
      },
    );
  }
}
