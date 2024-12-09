import 'package:flutter/material.dart';
import 'package:parcial/config/routes/app_router.dart';
import 'package:parcial/config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = true;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(isDarkTheme: isDarkTheme).themeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      builder: (context, child) {
        return Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: toggleTheme,
            backgroundColor: isDarkTheme ? Colors.orange : Colors.white,
            child: Icon(
              isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: isDarkTheme ? Colors.white : Colors.orange,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}
