import 'package:dio/dio.dart';
import 'package:parcial/entity/characte_entity.dart';
import 'package:parcial/models/character.dart';

class GetCharacter {
  static const url = "https://dragonball-api.com/api";
  final _dio = Dio();

  Future<List<CharacterEntity>> getPJ(
      {required int page, int limit = 10}) async {
    final response = await _dio.get("$url/characters", queryParameters: {
      'page': page,
      'limit': limit,
    });

    final temp = response.data["items"];
    List<CharacterEntity> pj = [];
    Character chModel;

    for (var i = 0; i < temp.length; i++) {
      chModel = Character.fromJsonMap(temp[i]);
      pj.add(CharacterEntity(
          id: chModel.id,
          nombre: chModel.name,
          descripcion: chModel.description,
          img: chModel.image,
          raza: chModel.race));
    }

    return pj;
  }
}
