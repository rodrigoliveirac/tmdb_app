import '../service/ApiService.dart';

class MovieDetailsController {
  final ApiService service;
  MovieDetailsController({required this.service});
  void loadMovieDetails(String id) {
    //service.getMovieDetails(id)
  }
}