import 'package:dio/dio.dart';

class GetPokemon {
  static const String url = "https://pokeapi.co/api/v2";
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchPokemonList(
      {int limit = 20, int offset = 0}) async {
    try {
      final response = await _dio.get("$url/pokemon", queryParameters: {
        'limit': limit,
        'offset': offset,
      });
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['results']);
      } else {
        throw Exception("Failed to load Pokémon list");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<Map<String, dynamic>> fetchPokemonDetails(String nameOrId) async {
    try {
      final response = await _dio.get("$url/pokemon/$nameOrId");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to load Pokémon details");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
