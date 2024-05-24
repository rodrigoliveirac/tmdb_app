class MovieDetailsResponse {
  bool adult;
  String backdropPath;
  int? belongsToCollection;
  int budget;
  List<String> genres;
  String homepage;
  int id;
  String? imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<dynamic>? productionCompanies;
  List<dynamic>? productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<dynamic>? spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailsResponse({
    required this.adult,
    required this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: null,
      budget: json['budget'],
      genres: List<dynamic>.from(json['genres']).map((e) =>
      (e as Map<String,dynamic>)['name'] as String
      ).toList(),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: null,
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: null,
      productionCountries: null,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: null,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}