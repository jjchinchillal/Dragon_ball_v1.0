import 'package:flutter/material.dart';
import 'package:parcial/presentation/screens/character/character_screen.dart';
import 'package:parcial/presentation/screens/planet/planet_screen.dart';
import 'package:parcial/presentation/screens/transformation/transformation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final List<Map<String, dynamic>> _menu = [
    {
      "title": "Personajes",
      "icon": Icons.person,
      "widget": const CharacterScreen(),
    },
    {
      "title": "Planetas",
      "icon": Icons.public,
      "widget": const PlanetScreen(),
    },
    {
      "title": "Transformaciones",
      "icon": Icons.flash_on,
      "widget": const TransformationScreen(),
    },
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indicator = 0;

  void changeIndicator(int index) {
    _indicator = index;
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dragon Ball",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: HomeScreen._menu[_indicator]["widget"],
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Goku",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
              accountEmail: Text("goku@dragonball.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://w7.pngwing.com/pngs/327/48/png-transparent-goku-black-drawing-dragon-ball-goku-fictional-character-cartoon-black.png',
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: HomeScreen._menu.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      HomeScreen._menu[index]['icon'],
                      color: Colors.orange,
                    ),
                    title: Text(
                      HomeScreen._menu[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      changeIndicator(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
