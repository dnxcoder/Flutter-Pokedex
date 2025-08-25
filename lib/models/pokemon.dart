import 'package:flutter_pokedex/models/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageURL;
  final List<PokemonType> pokemonTypes;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.pokemonTypes,
  });
}
