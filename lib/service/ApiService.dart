import 'dart:convert';
import 'dart:io';

import 'package:tmdb_app/controller/MovieDetailsController.dart';
import 'package:tmdb_app/model/MovieItemModel.dart';
import 'package:tmdb_app/model/PopularModel.dart';

import '../api_key.dart';
import '../model/MovieDetailsResponse.dart';

const String endpoint = 'https://api.themoviedb.org/3/movie';

class ApiService {
  final String endpointPopular = '$endpoint/popular';
  final String endpointMovieDetails = endpoint;
  final String imgUrl = 'https://image.tmdb.org/t/p/original/';

  Future<List<MovieItemModel>> getMovies() async {
    var client = HttpClient();
    try {
      HttpClientRequest request =
          await client.getUrl(Uri.parse(endpointPopular));
      request.headers.contentType =
          ContentType('application', 'json', charset: 'utf-8');
      request.headers.add(HttpHeaders.acceptHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $API_KEY');
      HttpClientResponse response = await request.close();

      final stringData = await response.transform(utf8.decoder).join();
      final movieMap = jsonDecode(stringData) as Map<String, dynamic>;

      final list = PopularModel.fromJson(movieMap)
          .results
          .map((item) => MovieItemModel(
              title: item.title,
              overview: item.overview,
              img: getUriImg(imgUrl, item.img),
              adult: item.adult,
              genreIds: item.genreIds,
              id: item.id,
              originalLang: item.originalLang,
              popularity: item.popularity,
              posterPath: getUriImg(imgUrl, item.posterPath),
              releaseDate: item.releaseDate,
              originalTitle: item.originalTitle,
              video: item.video,
              voteCount: item.voteCount,
              voteAverage: item.voteAverage))
          .toList();
      print(list.first.releaseDate);
      return list;
    } finally {
      client.close();
    }
  }

  String getUriImg(String endpoint, String img) {
    print('$endpoint$img');
    return '$endpoint$img';
  }

  Future<MovieDetailsModel> getMovieDetails(String id) async {
    var client = HttpClient();

    try {
      HttpClientRequest request =
          await client.getUrl(Uri.parse(getPathMovieDetails(id)));
      request.headers.contentType =
          ContentType('application', 'json', charset: 'utf-8');
      request.headers.add(HttpHeaders.acceptHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $API_KEY');
      HttpClientResponse response = await request.close();

      final stringData = await response.transform(utf8.decoder).join();
      final movieDetailsMap = jsonDecode(stringData) as Map<String, dynamic>;
      print(stringData);
      final movieModelResponse = MovieDetailsResponse.fromJson(movieDetailsMap);
      return MovieDetailsModel(
          id: movieModelResponse.id,
          title: movieModelResponse.title,
          overview: movieModelResponse.overview,
          image: getUriImg(imgUrl, movieModelResponse.backdropPath));
    } finally {
      client.close();
    }
  }

  String getPathMovieDetails(String id) {
    return '$endpointMovieDetails/$id';
  }
}
