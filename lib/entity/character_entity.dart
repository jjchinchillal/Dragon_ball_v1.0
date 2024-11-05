import 'package:parcial/entity/planet_entity.dart';
import 'package:parcial/entity/transformation_entity.dart';

class CharacterEntity {
  final int id;
  final String? name;
  final String? race;
  final String? description;
  final String? image;
  final String? ki;
  final String? maxKi;
  final String? gender;
  final String? affiliation;
  final PlanetEntity? originPlanet;
  final List<TransformationEntity>? transformations;

  CharacterEntity({
    required this.id,
    this.name,
    this.race,
    this.description,
    this.image,
    this.ki,
    this.maxKi,
    this.gender,
    this.affiliation,
    this.originPlanet,
    this.transformations,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json,
      {PlanetEntity? planet}) {
    return CharacterEntity(
      id: json['id'],
      name: json['name'],
      race: json['race'],
      description: json['description'],
      image: json['image'],
      ki: json['ki'],
      maxKi: json['maxKi'],
      gender: json['gender'],
      affiliation: json['affiliation'],
      originPlanet: planet,
      transformations: json['transformations'] != null
          ? (json['transformations'] as List)
              .map((trans) => TransformationEntity.fromJson(trans))
              .toList()
          : [],
    );
  }
}
