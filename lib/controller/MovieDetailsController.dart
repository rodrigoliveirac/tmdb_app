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
    _movieDetailsModel = await movieDetails;
    _isLoading = false;
    callback(_movieDetailsModel);
  }
}

class MovieDetailsModel {
  int id;
  String image;
  String title;
  String overview;

  MovieDetailsModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.overview});
}
