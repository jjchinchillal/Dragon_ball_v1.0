import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parcial/entity/planet_entity.dart';

class GetPlanet {
  Future<List<PlanetEntity>> getPlanets({required int page}) async {
    final response = await http.get(Uri.parse('https://dragonball-api.com/api/planets?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => PlanetEntity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load planets');
    }
  }
}
