import 'package:flutter/cupertino.dart';
import 'package:tmdb_app/model/MovieItemModel.dart';
import 'package:tmdb_app/service/ApiService.dart';

class MoviesController {

  late bool _isLoading;

  bool get isLoading => _isLoading;

  List<MovieItemModel> _movies = [];

  List<MovieItemModel> get movies => _movies;

  final ApiService service;

  MoviesController({required this.service});

  void loadMovies(void Function(List<MovieItemModel>) onResult) async {
    _isLoading = true;
    Future<List<MovieItemModel>> list = service.getMovies();
    _movies = await list;
    _isLoading = false;
    onResult(_movies);
  }

}

