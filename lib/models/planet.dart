import 'package:parcial/models/character.dart';

class PlanetEntity {
  final int id;
  final String? name;
  final bool? isDestroyed;
  final String? description;
  final String? image;
  final List<Character>? characters;

  PlanetEntity({
    required this.id,
    this.name,
    this.isDestroyed,
    this.description,
    this.image,
    this.characters,
  });

  factory PlanetEntity.fromJson(Map<String, dynamic> json,
      {List<Character>? characters}) {
    return PlanetEntity(
      id: json['id'],
      name: json['name'],
      isDestroyed: json['isDestroyed'],
      description: json['description'],
      image: json['image'],
      characters: characters ?? [],
    );
  }
}
