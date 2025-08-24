import 'package:flutter/material.dart';
import 'package:flutter_pokedex/views/components/pokemon_box.dart';

List<Widget> pokemons = [
  PokemonBox(
    id: 1,
    imgURL: "assasa",
    name: "bulbassasr",
    types: ["Grass", "Poyson"],
  ),
  PokemonBox(id: 2, imgURL: "assasa", name: "bulbassar", types: []),
  PokemonBox(id: 3, imgURL: "assasa", name: "bulbassar", types: []),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1.2,
      children: pokemons,
    );
  }
}
