import 'package:flutter_pokedex/enums/pokemon_type_color.dart';
import 'package:flutter_pokedex/models/pokemon_type.dart';

List<PokemonType> transform_type_pokemon(List<String> typesPokemon) {
  final treatedPokemonTypes = typesPokemon.map((t) {
    final typeString = t;

    return PokemonType(
      label: t,
      backgroundColor: PokemonTypeColor.values.byName(t),
    );
  }).toList();

  return treatedPokemonTypes;
}
