import 'package:flutter/material.dart';
import 'package:parcial/entity/planet_entity.dart';
import 'package:parcial/helpers/get_planet.dart';
import 'package:parcial/presentation/widgets/list_planet_item.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({super.key});

  @override
  PlanetScreenState createState() => PlanetScreenState();
}

class PlanetScreenState extends State<PlanetScreen> {
  final GetPlanet _petition = GetPlanet();
  final ScrollController _scrollController = ScrollController();

  List<PlanetEntity> planets = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchPlanets();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchPlanets();
      }
    });
  }

  Future<void> _fetchPlanets() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final newPlanets = await _petition.getPlanets(page: _currentPage);

    setState(() {
      planets.addAll(newPlanets);
      _currentPage++;
      _isLoading = false;

      if (newPlanets.isEmpty) {
        _hasMore = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planetas"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: planets.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: planets.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == planets.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListPlanetItem(planet: planets[index]);
              },
            ),
    );
  }
}
