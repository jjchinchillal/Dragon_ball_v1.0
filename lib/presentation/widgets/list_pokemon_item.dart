import 'package:flutter/material.dart';
import 'package:parcial/models/pokemon.dart';
import 'package:parcial/presentation/screens/pokemons/pokemon_detail_screen.dart';

class ListPokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const ListPokemonItem({super.key, required this.pokemon});

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
              pokemon.image ?? "https://via.placeholder.com/100",
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(pokemon.name ?? "Sin nombre"),
        subtitle: Text(pokemon.type ?? "Tipo desconocido"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(pokemon: pokemon),
            ),
          );
        },
      ),
    );
  }
}
