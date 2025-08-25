import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/services/poke_api.dart';
import 'package:flutter_pokedex/utils/transform_type_pokemon.dart';

class PokemonRepository {
  final PokeApi api;

  PokemonRepository(this.api);

  Future<List<Pokemon>> getFirstPokemons({int limit = 10}) async {
    final page = await api.fetchPokemonPage(limit: limit, offset: 0);
    final results = (page['results'] as List).cast<Map<String, dynamic>>();

    final details = await Future.wait(
      results.map((e) => api.fetchPokemonDetailByName(e['name'] as String)),
    );

    // Mapping

    final pokemons = details.map((d) {
      final id = d['id'] as int;
      final name = d['name'] as String;
      final typesList = (d['types'] as List)
          .map((t) => (t['type']['name'] as String))
          .toList();

      final image =
          (d['sprites']['other']['official-artwork']['front_default'] ??
                  d['sprites']['front_default'])
              as String?;

      return Pokemon(
        id: id,
        name: name,
        imageURL: image ?? '',
        pokemonTypes: transform_type_pokemon(typesList),
      );
    }).toList();

    return pokemons;
  }
}
