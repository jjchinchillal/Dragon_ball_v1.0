import 'package:flutter/material.dart';
import 'package:parcial/entity/characte_entity.dart';
import 'package:parcial/presentation/screens/character/character_detail_screen.dart';

class ListCharacterItem extends StatelessWidget {
  final CharacterEntity character;

  const ListCharacterItem({super.key, required this.character});

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
            child: Image.network(
              character.img ?? "https://via.placeholder.com/100",
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(character.nombre ?? "Sin nombre"),
        subtitle: Text(character.raza ?? "Raza desconocida"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(character: character),
            ),
          );
        },
      ),
    );
  }
}
