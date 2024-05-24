import 'package:flutter/material.dart';
import 'package:tmdb_app/controller/MovieDetailsController.dart';
import 'package:tmdb_app/controller/MoviesController.dart';
import 'package:tmdb_app/service/ApiService.dart';

import 'features/movies/widgets/screens/HomeScreen.dart';
import 'features/movies/widgets/screens/MovieDetailsScreen.dart';

void main() {
  late ApiService service = ApiService();
  late MoviesController moviesController = MoviesController(service: service);
  late MovieDetailsController movieDetailsController = MovieDetailsController(service: service);
  runApp(MyApp(moviesController: moviesController, movieDetailsController: movieDetailsController));
}

class MyApp extends StatelessWidget {
  final MoviesController moviesController;
  final MovieDetailsController movieDetailsController;

  MyApp({super.key, required this.moviesController, required this.movieDetailsController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MovieDetailsScreen.routeName: (context) =>
            MovieDetailsScreen(movieDetailsController: movieDetailsController)
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: HomeScreen(title: 'Tmdb App', controller: moviesController),
    );
  }
}
