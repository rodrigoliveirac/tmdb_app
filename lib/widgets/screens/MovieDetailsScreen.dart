import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
      body: (widget.movieDetailsController.isLoading)
          ? const ShimmerMovieDetails()
          : SingleChildScrollView(
              child: Column(
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

class ShimmerMovieDetails extends StatelessWidget {
  const ShimmerMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
              color: Colors.grey[300],
              height: 240,
              width: 600,
              child: const Center(heightFactor: 240, widthFactor: 600)),
        ),
        ShimmerMovieInfoContent()
      ],
    ));
  }
}

class ShimmerMovieInfoContent extends StatelessWidget {
  const ShimmerMovieInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                        color: Colors.grey[300],
                        height: 16,
                        width: double.infinity,
                        child: const Center(heightFactor: 16, widthFactor: double.infinity)),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                      color: Colors.grey[300],
                      height: 100,
                      width: double.infinity,
                      child: const Center(heightFactor: 200, widthFactor: double.infinity)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
