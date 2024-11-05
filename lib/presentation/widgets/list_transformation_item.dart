import 'package:flutter/material.dart';
import 'package:parcial/entity/transformation_entity.dart';
import 'package:parcial/presentation/screens/transformation/transformation_details_screen.dart';

class ListTransformationItem extends StatelessWidget {
  final TransformationEntity transformation;

  const ListTransformationItem({super.key, required this.transformation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: ExpansionTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: transformation.img != null
                ? Image.network(transformation.img!)
                : const Placeholder(),
          ),
        ),
        title: Text(transformation.name ?? "Sin nombre"),
        subtitle: Text(transformation.description ?? "Sin descripción"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    transformation.img ?? "https://via.placeholder.com/150",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                    "Descripción: ${transformation.description ?? 'Sin descripción'}"),
              ],
            ),
          ),
        ],
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TransformationDetailScreen(transformation: transformation),
              ),
            );
          }
        },
      ),
    );
  }
}
