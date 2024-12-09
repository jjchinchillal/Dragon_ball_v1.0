import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anime",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Selecciona una opción",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push('/dragonball');
                    },
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://w7.pngwing.com/pngs/192/205/png-transparent-dragonball-characters-illustration-goku-vegeta-t-shirt-gohan-dragon-ball-dragon-ball-z-manga-computer-wallpaper-fictional-character-thumbnail.png',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Dragon Ball",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.push('/pokemon');
                    },
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/83/16/24/831624cde28386da9b1d0049a6004c16.png',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Pokémon",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
