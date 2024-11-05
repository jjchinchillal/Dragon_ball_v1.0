import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkTheme;

  AppTheme({this.isDarkTheme = true});

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.orange : Colors.orange,
        foregroundColor: isDarkTheme ? Colors.black : Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isDarkTheme ? Colors.orange : Colors.white,
        foregroundColor: isDarkTheme ? Colors.white : Colors.orange,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
