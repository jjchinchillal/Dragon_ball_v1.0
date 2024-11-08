import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    /* {
      "title": "Transformaciones",
      "icon": Icons.flash_on,
      "route": '/transformations',
    }, */
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
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Text(
                  'Menú Dragon Ball',
                  style: TextStyle(
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
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
