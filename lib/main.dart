import 'package:flutter/material.dart';
import 'package:tmdb_app/controller/MoviesController.dart';
import 'package:tmdb_app/model/MovieItemModel.dart';
import 'package:tmdb_app/widgets/MovieList.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;
  final MoviesController controller;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MovieItemModel> movies = [];

  @override
  void initState() {
    super.initState();
    widget.controller.loadMovies((movies) {
      updateMovies(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: (widget.controller.isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : MovieList(movies: widget.controller.movies));
  }

  void updateMovies(List<MovieItemModel> movies) {
    setState(() {
      this.movies = movies;
    });
  }
}
