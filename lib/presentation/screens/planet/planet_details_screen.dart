import 'package:flutter/material.dart';
import 'package:parcial/entity/planet_entity.dart';

class PlanetDetailScreen extends StatelessWidget {
  final PlanetEntity planet;

  const PlanetDetailScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name ?? "Sin nombre"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                    planet.image ?? "https://via.placeholder.com/200",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Nombre: ${planet.name ?? "Desconocido"}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Descripción: ${planet.description ?? "No disponible"}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                "Estado: ${planet.isDestroyed == true ? "Destruido" : "Intacto"}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Personajes en este planeta:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              planet.characters != null && planet.characters!.isNotEmpty
                  ? Column(
                      children: planet.characters!.map((character) {
                        return ListTile(
                          title: Text(character.name ?? "Sin nombre"),
                        );
                      }).toList(),
                    )
                  : const Text("No hay personajes asociados."),
            ],
          ),
        ),
      ),
    );
  }
}
