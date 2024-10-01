class CharacterEntity {
  final int id;
  final String? nombre;
  final String? raza;
  final String? descripcion;
  final String? img;

  CharacterEntity({
    required this.id,
    this.nombre,
    this.raza,
    this.descripcion,
    this.img,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      id: json['id'],
      nombre: json['name'],
      raza: json['race'],
      descripcion: json['description'],
      img: json['image'],
    );
  }
}
