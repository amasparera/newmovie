import 'package:newmovie/app/data/model/genre.dart';
import 'package:newmovie/app/data/model/production_compaines.dart';
import 'package:newmovie/app/data/model/production_country.dart';
import 'package:newmovie/app/data/model/spoken_languages.dart';

class MovieDetail {
  final bool adult;
  final String backdropPath;
  final String? belongsToCollection;
  final int budget;
  final List<Genre> genre;
  final String homePage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountry> productionCountry;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanggues> spokenLanguages;
  final String status;
  final String tagLine;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetail(
      {required this.adult,
      required this.backdropPath,
      this.belongsToCollection,
      required this.budget,
      required this.genre,
      required this.homePage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountry,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagLine,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory MovieDetail.fromJson(Map<String, dynamic> map) {
    return MovieDetail(
        adult: map["adult"],
        backdropPath: map["backdrop_path"],
        budget: map["budget"],
        genre: (map["genres"] as List<dynamic>)
            .map((e) => Genre.fromJson(e))
            .toList(),
        homePage: map["homepage"],
        id: map["id"],
        imdbId: map["imdb_id"],
        originalLanguage: map["original_language"],
        originalTitle: map["original_title"],
        overview: map["overview"],
        popularity: map["popularity"],
        posterPath: map["poster_path"],
        productionCompanies: (map["production_companies"] as List<dynamic>)
            .map((e) => ProductionCompanies.fromJson(e))
            .toList(),
        productionCountry: (map["production_countries"] as List<dynamic>)
            .map((e) => ProductionCountry.fromJson(e))
            .toList(),
        releaseDate: map["release_date"],
        revenue: map["revenue"],
        runtime: map["runtime"],
        spokenLanguages: (map["spoken_languages"] as List<dynamic>)
            .map((e) => SpokenLanggues.fromJson(e))
            .toList(),
        status: map["status"],
        tagLine: map["tagline"],
        title: map["title"],
        video: map["video"],
        voteAverage: map["vote_average"],
        voteCount: map["vote_count"]);
  }
}
