import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parcial/entity/transformation_entity.dart';

class GetTransformation {
  Future<List<TransformationEntity>> getTransformations(
      {required int page}) async {
    final response = await http.get(
        Uri.parse('https://dragonball-api.com/api/transformations?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is Map<String, dynamic> &&
          data.containsKey('items') &&
          data['items'] is List) {
        final List<dynamic> items = data['items'];
        return items
            .map((item) => TransformationEntity.fromJson(item))
            .toList();
      } else {
        throw Exception('Unexpected JSON format');
      }
    } else {
      throw Exception('Failed to load transformations');
    }
  }
}
