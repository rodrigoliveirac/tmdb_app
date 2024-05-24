import 'package:flutter/material.dart';
import 'package:tmdb_app/navigation/arguments/MovieDetailsScreenArgs.dart';

import '../../controller/MovieDetailsController.dart';
import '../ImageSection.dart';
import '../MovieInfoContent.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsController movieDetailsController;

  const MovieDetailsScreen({super.key, required this.movieDetailsController});

  static const routeName = '/movieDetails';

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late String titleAppBar;
  late String image;
  late String title;
  late String overview;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as MovieDetailsScreenArgs;
    setState(() {
      titleAppBar = args.title;
    });
    widget.movieDetailsController.loadMovieDetails(args.movieId, ((movie) {
      updateScreenState(movie);
    }));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppBar),
      ),
      body: SingleChildScrollView(
        child: (widget.movieDetailsController.isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ImageSection(
                    image: image,
                  ),
                  MovieInfoContent(title: title, overview: overview),
                ],
              ),
      ),
    );
  }

  void updateScreenState(MovieDetailsModel movie) {
    setState(() {
      title = movie.title;
      image = movie.image;
      overview = movie.overview;
    });
  }
}
