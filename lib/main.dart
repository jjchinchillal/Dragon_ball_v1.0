import 'package:flutter/material.dart';
import 'package:parcial/config/theme.dart';
import 'package:parcial/config/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(selectedColor: 0).themeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
