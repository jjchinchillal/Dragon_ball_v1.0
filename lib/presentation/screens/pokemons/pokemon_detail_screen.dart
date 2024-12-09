import 'package:flutter/material.dart';
import 'package:parcial/models/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? "Sin nombre"),
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
                    pokemon.image ?? "https://via.placeholder.com/200",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tipo: ${pokemon.type ?? "Desconocido"}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Habilidades: ${pokemon.abilities?.join(", ") ?? "No disponible"}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                "Peso: ${pokemon.weight ?? "N/A"} kg",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                "Altura: ${pokemon.height ?? "N/A"} m",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Estadísticas Base:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.stats?.entries.map((entry) {
                      return Text(
                        "${entry.key}: ${entry.value}",
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList() ??
                    [const Text("No disponible")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
