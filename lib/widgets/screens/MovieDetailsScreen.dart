import 'package:flutter/material.dart';
import 'package:tmdb_app/navigation/arguments/MovieDetailsScreenArgs.dart';

import '../../controller/MovieDetailsController.dart';

class MovieDetailsScreen extends StatelessWidget {

  final MovieDetailsController movieDetailsController;
  const MovieDetailsScreen({super.key, required this.movieDetailsController});

  static const routeName = '/movieDetails';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as MovieDetailsScreenArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.movieId),
      ),
    );
  }
}