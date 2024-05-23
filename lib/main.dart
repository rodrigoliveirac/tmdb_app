import 'package:flutter/material.dart';
import 'package:tmdb_app/model/MovieItemModel.dart';
import 'package:tmdb_app/widgets/MovieItem.dart';
import 'package:tmdb_app/widgets/MovieList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tmdb App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<MovieItemModel> movies = [
    MovieItemModel(title: "titulo 1", img: "img 1", description: "desc 1"),
    MovieItemModel(title: "titulo 2", img: "img 2", description: "desc 2"),
    MovieItemModel(title:
    "titulo 3", img: "img 3", description: "desc 3"),
    MovieItemModel(title: "titulo 4", img: "img 4", description: "desc 4"),
    MovieItemModel(title: "titulo 5", img: "img 5", description: "desc 5"),
    MovieItemModel(title: "titulo 6", img: "img 6", description: "desc 6")
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: MovieList(movies: movies));
  }
}
