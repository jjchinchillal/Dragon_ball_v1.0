class TransformationEntity {
  final int id;
  final String? name;
  final String? description;
  final String? img;

  TransformationEntity({
    required this.id,
    this.name,
    this.description,
    this.img,
  });

  factory TransformationEntity.fromJson(Map<String, dynamic> json) {
    return TransformationEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      img: json['image'],
    );
  }
}
