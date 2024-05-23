import 'dart:convert';
import 'dart:io';

import 'package:tmdb_app/model/MovieItemModel.dart';

class ApiService {
  String endpoint = 'https://api.themoviedb.org/3/movie/popular';

  Future<void> getMovies() async {

    var client = HttpClient();
    try {
      HttpClientRequest request = await client.getUrl(Uri.parse(endpoint));
      request.headers.contentType = ContentType('application', 'json', charset: 'utf-8');
      request.headers.add(HttpHeaders.acceptHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTliZTQ5YmU5ZTE2OGI1NjhmYmRiOWIxYzA4NjIzZSIsInN1YiI6IjYyYTdjMzY2MzM2ZTAxMDA1MGRiNTFjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2VCYuerWrhKGkD_72tcodTcDnZP8o6XxW0neb51reZI');
      HttpClientResponse response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();
      print(stringData);
    } finally {
      client.close();
    }
  }
}
