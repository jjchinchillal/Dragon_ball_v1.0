import 'package:flutter/material.dart';
import 'package:parcial/entity/planet_entity.dart';
import 'package:parcial/presentation/screens/planet/planet_details_screen.dart';

class ListPlanetItem extends StatelessWidget {
  final PlanetEntity planet;

  const ListPlanetItem({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: planet.image != null
                ? Image.network(planet.image!, fit: BoxFit.cover)
                : const Placeholder(),
          ),
        ),
        title: Text(planet.name ?? "Sin nombre"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanetDetailScreen(planet: planet),
            ),
          );
        },
      ),
    );
  }
}
