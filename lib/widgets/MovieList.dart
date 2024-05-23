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
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: movies.length, // total number of items
      itemBuilder: (context, index) {
        return MovieItem(
            img: movies[index].img,
            title: movies[index].title,
            description: movies[index].description
        );
      },
    );
  }
}