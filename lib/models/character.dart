class Character {
  final int id;
  final String? name;
  final String? race;
  final String? description;
  final String? image;
  final String? ki;
  final String? maxKi;
  final String? gender;
  final String? affiliation;

  Character(
      {required this.id,
      this.name,
      this.race,
      this.description,
      this.image,
      this.ki,
      this.maxKi,
      this.gender,
      this.affiliation});

  factory Character.fromJsonMap(Map<dynamic, dynamic> json) => Character(
      id: json["id"],
      name: json['name'] ?? "No name",
      race: json['race'] ?? "No race",
      description: json['description'] ?? "No description",
      image: json['image'] ?? "No image",
      ki: json['ki'] ?? "Unknown",
      maxKi: json['maxKi'] ?? "Unknown",
      gender: json['gender'] ?? "Unknown",
      affiliation: json['affiliation'] ?? "No affiliation");
}
