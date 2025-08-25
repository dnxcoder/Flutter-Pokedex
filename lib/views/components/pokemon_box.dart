import 'package:flutter/material.dart';
import 'package:flutter_pokedex/enums/pokemon_type_color.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/models/pokemon_type.dart';

class PokemonBox extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonBox({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: pokemon.pokemonTypes[0].backgroundColor.color.withValues(
          alpha: 0.8,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ...pokemon.pokemonTypes.map(
                (pokemonType) => Container(
                  padding: EdgeInsets.only(
                    bottom: 4,
                    top: 4,
                    left: 10,
                    right: 10,
                  ),
                  margin: EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: pokemonType.backgroundColor.color,
                  ),
                  child: Text(
                    pokemonType.label,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ), // padding interno
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.network(
              pokemon.imageURL,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
