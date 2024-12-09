import 'package:flutter/material.dart';
import 'package:parcial/entity/transformation_entity.dart';

class TransformationDetailScreen extends StatelessWidget {
  final TransformationEntity transformation;

  const TransformationDetailScreen({super.key, required this.transformation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(transformation.name ?? "Sin nombre"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre: ${transformation.name ?? "Desconocido"}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Descripción: ${transformation.description ?? "No disponible"}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
