import 'package:flutter/material.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(const WorkshopManagerApp());
}

class WorkshopManagerApp extends StatelessWidget {
  const WorkshopManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workshop Equipment Manager',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF246BFD),
        ),
      ),

      home: const CatalogScreen(),
    );
  }
}
