import 'package:flutter_recruitment_task/models/belongs_to_collection.dart';
import 'package:flutter_recruitment_task/models/genres.dart';
import 'package:flutter_recruitment_task/models/production_companies.dart';
import 'package:flutter_recruitment_task/models/production_countries.dart';
import 'package:flutter_recruitment_task/models/spoken_languages.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genres>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String? releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails(
      {required this.adult,
      required this.backdropPath,
      required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
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
      required this.voteCount});

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String?, dynamic> toJson() => _$MovieDetailsToJson(this);
}
