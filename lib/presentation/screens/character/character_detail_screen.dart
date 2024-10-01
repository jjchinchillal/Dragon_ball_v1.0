import 'package:flutter/material.dart';
import 'package:parcial/entity/characte_entity.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.nombre ?? "Sin nombre"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    character.img ?? "https://via.placeholder.com/200",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Raza: ${character.raza ?? "Desconocida"}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Descripción: ${character.descripcion ?? "No disponible"}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
