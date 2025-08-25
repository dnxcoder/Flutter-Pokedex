import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApi {
  static const _base = "https://pokeapi.co/api/v2";

  Future<Map<String, dynamic>> fetchPokemonPage({
    int limit = 10,
    int offset = 0,
  }) async {
    final uri = Uri.parse('$_base/pokemon?limit=$limit&offset=$offset');
    final res = await http.get(uri);

    if (res.statusCode != 200) {
      throw Exception('Erro ao buscar lista: ${res.statusCode}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> fetchPokemonDetailByName(String name) async {
    final uri = Uri.parse('$_base/pokemon/$name');
    final res = await http.get(uri);
    if (res.statusCode != 200) {
      throw Exception('Erro ao buscar detalhe de $name: ${res.statusCode}');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }
}
