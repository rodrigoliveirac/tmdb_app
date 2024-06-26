import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/MoviesController.dart';
import '../../../../model/MovieItemModel.dart';
import '../../../../navigation/arguments/MovieDetailsScreenArgs.dart';
import '../MovieList.dart';
import 'MovieDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.controller});

  final String title;
  final MoviesController controller;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            ? const ShimmerList()
            : MovieList(
                movies: widget.controller.movies,
                onMovieDetails: ((movieId) => {
                      Navigator.pushNamed(
                        context,
                        MovieDetailsScreen.routeName,
                        arguments:
                            MovieDetailsScreenArgs('$movieId', 'Movie Details'),
                      )
                    }),
              ));
  }

  void updateMovies(List<MovieItemModel> movies) {
    setState(() {
      this.movies = movies;
    });
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 16.0, // spacing between rows
          crossAxisSpacing: 16.0, // spacing between columns
        ),
        padding: const EdgeInsets.all(24.0),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center());
        },
      ),
    );
  }
}
