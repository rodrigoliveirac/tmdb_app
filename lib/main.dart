import 'package:flutter/material.dart';
import 'package:tmdb_app/controller/MoviesController.dart';
import 'package:tmdb_app/widgets/stateful/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final MoviesController controller = MoviesController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Tmdb App', controller: controller),
    );
  }
}
