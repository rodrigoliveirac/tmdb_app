import 'package:flutter/material.dart';
import '../model/MovieItemModel.dart';
import 'MovieItem.dart';

class MovieList extends StatelessWidget {
  final List<MovieItemModel> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 16.0, // spacing between rows
        crossAxisSpacing: 16.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(24.0),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieItem(
            img: movies[index].posterPath,
            title: movies[index].title,
            description: movies[index].overview);
      },
    );
  }
}
