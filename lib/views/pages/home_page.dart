import 'package:flutter/material.dart';
import 'package:flutter_pokedex/enums/pokemon_type_color.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/models/pokemon_type.dart';
import 'package:flutter_pokedex/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/services/poke_api.dart';
import 'package:flutter_pokedex/views/components/pokemon_box.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _pokemonRepo = PokemonRepository(PokeApi());
  late final Future<List<Pokemon>> _loadedPokemons = _pokemonRepo
      .getFirstPokemons(limit: 100);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _loadedPokemons,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        final data = snapshot.data ?? [];
        if (data.isEmpty) {
          return const Center(child: Text("Nenhum pokemon encontrado."));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.2,
          ),
          itemCount: data.length,
          itemBuilder: (_, i) => PokemonBox(pokemon: data[i]),
        );
      },
    );
  }
}
