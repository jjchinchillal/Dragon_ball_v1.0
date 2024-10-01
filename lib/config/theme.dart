import 'package:flutter/material.dart';

const List<Color> _colorTheme = [
  Colors.black,
  Colors.white,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.purple
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0});

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: _colorTheme[selectedColor],
        foregroundColor: Colors.orange,
      ),
      textTheme: const TextTheme(),
    );
  }
}
