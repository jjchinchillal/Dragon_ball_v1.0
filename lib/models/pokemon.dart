class Pokemon {
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

  Pokemon({
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

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"] ?? "No name",
        type: json["types"] != null && json["types"].isNotEmpty
            ? json["types"][0]["type"]["name"]
            : "Unknown",
        description: json["description"] ?? "No description",
        image: json["sprites"]?["front_default"] ?? defaultImageUrl,
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

const String defaultImageUrl = "https://via.placeholder.com/200";
