import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:parcial/presentation/widgets/custom_drawer.dart';

class DragonBallScreen extends StatefulWidget {
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
  State<DragonBallScreen> createState() => _DragonBallScreenState();
}

class _DragonBallScreenState extends State<DragonBallScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/db_1.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: Stack(
        children: [
          // Video de fondo
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),

          Center(
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
        ],
      ),
      drawer: CustomDrawer(
        headerTitle: 'Menú Dragon Ball',
        menuOptions: DragonBallScreen._menu,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
