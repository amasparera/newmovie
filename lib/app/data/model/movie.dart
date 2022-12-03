class Movie {
  final bool adult;
  final String? backdropPath;
  final List<int> genre;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final String voteAverage;
  final int voteCount;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.genre,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
        adult: map["adult"],
        backdropPath: map["backdrop_path"],
        genre: map["genre_ids"] != null
            ? (map["genre_ids"] as List).map((e) => e as int).toList()
            : [],
        id: map["id"],
        originalLanguage: map["original_language"],
        originalTitle: map["original_title"],
        overview: map["overview"],
        popularity: map["popularity"],
        posterPath: map["poster_path"],
        releaseDate: map["release_date"],
        title: map["title"],
        video: map["video"],
        voteAverage: map["vote_average"].toString(),
        voteCount: map["vote_count"]);
  }
}
