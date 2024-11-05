import 'package:dio/dio.dart';
import 'package:parcial/entity/character_entity.dart';
import 'package:parcial/entity/transformation_entity.dart';
import 'package:parcial/entity/planet_entity.dart';

class GetCharacter {
  static const String url = "https://dragonball-api.com/api";
  final Dio _dio = Dio();

  Future<Map<int, PlanetEntity>> _fetchPlanets(int page) async {
    final response =
        await _dio.get("$url/planets", queryParameters: {'page': page});
    if (response.statusCode == 200) {
      final List<dynamic> items = response.data["items"];
      return {for (var item in items) item['id']: PlanetEntity.fromJson(item)};
    } else {
      throw Exception("Failed to load planets");
    }
  }

  Future<List<CharacterEntity>> getCharacters(
      {required int page, int limit = 10}) async {
    final planetsById = await _fetchPlanets(page);

    final response = await _dio.get("$url/characters", queryParameters: {
      'page': page,
      'limit': limit,
    });

    if (response.statusCode == 200) {
      final List<dynamic> items = response.data["items"];
      List<CharacterEntity> characters = [];

      for (var item in items) {
        final int? originPlanetId = item['originPlanet']?['id'];

        PlanetEntity? originPlanet =
            originPlanetId != null ? planetsById[originPlanetId] : null;

        final character = CharacterEntity(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          image: item['image'],
          race: item['race'],
          ki: item['ki'],
          maxKi: item['maxKi'],
          gender: item['gender'],
          affiliation: item['affiliation'],
          originPlanet: originPlanet,
          transformations: item['transformations'] != null
              ? (item['transformations'] as List<dynamic>)
                  .map((trans) => TransformationEntity.fromJson(trans))
                  .toList()
              : [],
        );
        characters.add(character);

        if (originPlanet != null && originPlanetId != null) {
          planetsById[originPlanetId] = originPlanet.copyWith(
            characters: [...?originPlanet.characters, character],
          );
        }
      }

      return characters;
    } else {
      throw Exception("Failed to load characters");
    }
  }
}
