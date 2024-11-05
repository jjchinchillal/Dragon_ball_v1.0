import 'package:parcial/entity/character_entity.dart';

class PlanetEntity {
  final int id;
  final String? name;
  final bool? isDestroyed;
  final String? description;
  final String? image;
  final List<CharacterEntity>? characters;

  PlanetEntity({
    required this.id,
    this.name,
    this.isDestroyed,
    this.description,
    this.image,
    this.characters,
  });

  factory PlanetEntity.fromJson(Map<String, dynamic> json,
      {List<CharacterEntity>? characters}) {
    return PlanetEntity(
      id: json['id'],
      name: json['name'],
      isDestroyed: json['isDestroyed'],
      description: json['description'],
      image: json['image'],
      characters: characters ?? [],
    );
  }

  PlanetEntity copyWith({List<CharacterEntity>? characters}) {
    return PlanetEntity(
      id: id,
      name: name,
      isDestroyed: isDestroyed,
      description: description,
      image: image,
      characters: characters ?? this.characters,
    );
  }
}
