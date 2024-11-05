import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parcial/helpers/get_pokemon.dart';
import 'package:parcial/models/pokemon.dart';
import 'package:parcial/presentation/widgets/list_pokemon_item.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  PokemonListScreenState createState() => PokemonListScreenState();
}

class PokemonListScreenState extends State<PokemonListScreen> {
  final GetPokemon _petition = GetPokemon();
  final ScrollController _scrollController = ScrollController();

  List<Pokemon> pokemonList = [];
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchPokemon();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchPokemon();
      }
    });
  }

  Future<void> _fetchPokemon() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final pokemonData =
          await _petition.fetchPokemonList(offset: _currentPage * 20);

      List<Pokemon> newPokemonList = [];
      for (var data in pokemonData) {
        final details = await _petition.fetchPokemonDetails(data['name']);
        newPokemonList.add(Pokemon.fromJson(details));
      }

      setState(() {
        pokemonList.addAll(newPokemonList);
        _currentPage++;
        _isLoading = false;
        if (newPokemonList.isEmpty) {
          _hasMore = false;
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasMore = false;
      });
      if (kDebugMode) {
        print("Error fetching Pokémon: $e");
      }
    }
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
        title: const Text(
          "Pokémones",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: pokemonList.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: pokemonList.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == pokemonList.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListPokemonItem(pokemon: pokemonList[index]);
              },
            ),
    );
  }
}
