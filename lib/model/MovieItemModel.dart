
class MovieItemModel {
  String title;
  String overview;
  String img;
  bool adult;
  List<int> genreIds;
  int id;
  String originalLang;
  double popularity;
  String posterPath;
  String releaseDate;
  String originalTitle;
  bool video;
  double voteAverage;
  int voteCount;

  MovieItemModel(
      {required this.title,
      required this.overview,
      required this.img,
      required this.adult,
      required this.genreIds,
      required this.id,
      required this.originalLang,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.originalTitle,
      required this.video,
      required this.voteCount,
      required this.voteAverage});

  MovieItemModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] as bool,
        img = json['backdrop_path'] as String,
        genreIds = (json['genre_ids'] as List<dynamic>).map( (entry) =>
            entry as int
        ).toList(),
        id = json['id'] as int,
        originalLang = json['original_language'] as String,
        originalTitle = json['original_title'] as String,
        overview = json['overview'] as String,
        popularity = json['popularity'] as double,
        posterPath = json['poster_path'] as String,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        video = json['video'] as bool,
        voteAverage = json['vote_average'] as double,
        voteCount = json['vote_count'] as int;
}
