import 'package:flutter/material.dart';
import 'pages/animal_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animal List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimalListScreen(),
    );
  }
}
