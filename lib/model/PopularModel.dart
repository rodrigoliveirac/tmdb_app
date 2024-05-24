import 'package:tmdb_app/model/MovieItemModel.dart';

class PopularModel {
  int page;
  List<MovieItemModel> results;
  int totalPages;
  int totalResults;

  PopularModel(
      {required this.page, required this.results, required this.totalPages, required this.totalResults});

  PopularModel.fromJson(Map<String, dynamic> json)
      : page = json['page'] as int,
        results = (json['results'] as List<dynamic>).map( (entry) =>
            MovieItemModel.fromJson(entry as Map<String,dynamic>)
        ).toList(),
        totalPages = json['total_results'] as int,
        totalResults = json['total_pages'] as int;
}