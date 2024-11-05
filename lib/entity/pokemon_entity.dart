class PokemonEntity {
  final int id;
  final String? name;
  final String? type;
  final String? description;
  final String? image;
  final int? height;
  final int? weight;
  final int? baseExperience;
  final List<String>? abilities;
  final Map<String, int>? stats;

  PokemonEntity({
    required this.id,
    this.name,
    this.type,
    this.description,
    this.image,
    this.height,
    this.weight,
    this.baseExperience,
    this.abilities,
    this.stats,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      id: json["id"],
      name: json["name"] ?? "Sin nombre",
      type: json["types"] != null && json["types"].isNotEmpty
          ? json["types"][0]["type"]["name"]
          : "Desconocido",
      description: json["description"] ?? "No disponible",
      image: json["sprites"]?["front_default"] ?? "No imagen",
      height: json["height"],
      weight: json["weight"],
      baseExperience: json["base_experience"],
      abilities: json["abilities"] != null
          ? (json["abilities"] as List)
              .map<String>((ability) => ability["ability"]["name"] as String)
              .toList()
          : [],
      stats: json["stats"] != null
          ? {
              for (var stat in json["stats"])
                stat["stat"]["name"]: stat["base_stat"]
            }
          : {},
    );
  }
}
