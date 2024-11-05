import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  static final List<Map<String, dynamic>> _menu = [
    {
      "title": "Pokémon",
      "icon": Icons.catching_pokemon,
      "route": '/pokemons',
    },
    {
      "title": "Berries",
      "icon": Icons.grass,
      "route": '/berries',
    },
    {
      "title": "Movimientos",
      "icon": Icons.flash_on,
      "route": '/moves',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokémon",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://preview.redd.it/for-being-ashs-final-moments-in-the-anime-aim-to-be-a-v0-14qsjndw0coa1.jpg?auto=webp&s=c91b3feda9b1666e0019da2faeef2b90b3728fc1',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Selecciona una opción del menú",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Center(
                child: Text(
                  'Menú Pokémon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _menu.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      _menu[index]['icon'],
                      color: Colors.orange,
                    ),
                    title: Text(
                      _menu[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      context.push(_menu[index]['route']);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
