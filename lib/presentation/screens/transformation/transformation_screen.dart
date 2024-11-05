import 'package:flutter/material.dart';
import 'package:parcial/entity/transformation_entity.dart';
import 'package:parcial/helpers/get_transformation.dart';
import 'package:parcial/presentation/widgets/list_transformation_item.dart';

class TransformationScreen extends StatefulWidget {
  const TransformationScreen({super.key});

  @override
  TransformationScreenState createState() => TransformationScreenState();
}

class TransformationScreenState extends State<TransformationScreen> {
  final GetTransformation _petition = GetTransformation();
  final ScrollController _scrollController = ScrollController();

  List<TransformationEntity> transformations = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchTransformations();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchTransformations();
      }
    });
  }

  Future<void> _fetchTransformations() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final newTransformations =
        await _petition.getTransformations(page: _currentPage);

    setState(() {
      transformations.addAll(newTransformations);
      _currentPage++;
      _isLoading = false;

      if (newTransformations.isEmpty) {
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
        title: const Text("Transformaciones"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: transformations.isEmpty && _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: transformations.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == transformations.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListTransformationItem(
                    transformation: transformations[index]);
              },
            ),
    );
  }
}
