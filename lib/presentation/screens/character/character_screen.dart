import 'package:flutter/material.dart';
import 'package:parcial/entity/character_entity.dart';
import 'package:parcial/helpers/get_characters.dart';
import 'package:parcial/presentation/widgets/list_character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends State<CharacterScreen> {
  final GetCharacter _petition = GetCharacter();
  final ScrollController _scrollController = ScrollController();

  List<CharacterEntity> characters = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchCharacters();
      }
    });
  }

  Future<void> _fetchCharacters() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final newCharacters = await _petition.getCharacters(page: _currentPage);

    setState(() {
      characters.addAll(newCharacters as Iterable<CharacterEntity>);
      _currentPage++;
      _isLoading = false;

      if (newCharacters.isEmpty) {
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
        title: const Text(
          "Personajes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: characters.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: characters.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == characters.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListCharacterItem(character: characters[index]);
              },
            ),
    );
  }
}
