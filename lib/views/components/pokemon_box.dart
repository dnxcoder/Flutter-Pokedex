import 'package:flutter/material.dart';

class PokemonBox extends StatelessWidget {
  final String name;
  final List<String> types;
  final int id;
  final String imgURL;

  const PokemonBox({
    super.key,
    required this.name,
    required this.types,
    required this.id,
    required this.imgURL,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name[0].toUpperCase() + name.substring(1),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ...types.map(
                (type) => Container(
                  padding: EdgeInsets.only(
                    bottom: 4,
                    top: 4,
                    left: 10,
                    right: 10,
                  ),
                  margin: EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.shade400,
                  ),
                  child: Text(
                    type,
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
              "https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png",
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
