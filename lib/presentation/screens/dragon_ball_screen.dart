import 'package:flutter/material.dart';
import 'package:parcial/presentation/widgets/custom_drawer.dart';

class DragonBallScreen extends StatelessWidget {
  const DragonBallScreen({super.key});

  static final List<Map<String, dynamic>> _menu = [
    {
      "title": "Personajes",
      "icon": Icons.person,
      "route": '/characters',
    },
    {
      "title": "Planetas",
      "icon": Icons.public,
      "route": '/planets',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dragon Ball",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://www.pngarts.com/files/4/Dragon-Ball-Z-Logo-PNG-Image-Background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Selecciona una opción del menú",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        headerTitle: 'Menú Dragon Ball',
        menuOptions: _menu,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
