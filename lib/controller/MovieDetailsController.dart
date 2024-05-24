import 'package:tmdb_app/model/ActorModel.dart';

import '../service/ApiService.dart';

class MovieDetailsController {
  final ApiService service;
  late bool _isLoading;

  bool get isLoading => _isLoading;
  late MovieDetailsModel _movieDetailsModel;

  MovieDetailsModel get model => _movieDetailsModel;

  MovieDetailsController({required this.service});

  void loadMovieDetails(
      String id, void Function(MovieDetailsModel) callback) async {
    _isLoading = true;
    Future<MovieDetailsModel> movieDetails = service.getMovieDetails(id);
    Future<List<ActorModel>> actors = service.getActors(id);
    var modelDetails = await movieDetails;
    _movieDetailsModel = MovieDetailsModel(
        id: modelDetails.id,
        title: modelDetails.title,
        image: modelDetails.image,
        overview: modelDetails.overview,
        actors: await actors);
    _isLoading = false;
    callback(_movieDetailsModel);
  }
}

class MovieDetailsModel {
  int id;
  String image;
  String title;
  String overview;
  List<ActorModel> actors;

  MovieDetailsModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.overview,
      required this.actors});
}
