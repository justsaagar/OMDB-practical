import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails {
  @JsonKey(name: 'Title')
  final String? title;

  @JsonKey(name: 'Year')
  final String? year;

  @JsonKey(name: 'Rated')
  final String? rated;

  @JsonKey(name: 'Released')
  final String? released;

  @JsonKey(name: 'Runtime')
  final String? runtime;

  @JsonKey(name: 'Genre')
  final String? genre;

  @JsonKey(name: 'Director')
  final String? director;

  @JsonKey(name: 'Writer')
  final String? writer;

  @JsonKey(name: 'Actors')
  final String? actors;

  @JsonKey(name: 'Plot')
  final String? plot;

  @JsonKey(name: 'Language')
  final String? language;

  @JsonKey(name: 'Country')
  final String? country;

  @JsonKey(name: 'Awards')
  final String? awards;

  @JsonKey(name: 'Poster')
  final String? poster;

  @JsonKey(name: 'Ratings')
  final List<Rating> ratings;

  @JsonKey(name: 'Metascore')
  final String? metascore;

  @JsonKey(name: 'imdbRating')
  final String? imdbRating;

  @JsonKey(name: 'imdbVotes')
  final String? imdbVotes;

  @JsonKey(name: 'imdbID')
  final String? imdbID;

  @JsonKey(name: 'Type')
  final String? type;

  @JsonKey(name: 'DVD')
  final String? dvd;

  @JsonKey(name: 'BoxOffice')
  final String? boxOffice;

  @JsonKey(name: 'Production')
  final String? production;

  @JsonKey(name: 'Website')
  final String? website;

  @JsonKey(name: 'Response')
  final String? response;

  MovieDetails({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings = const <Rating>[],
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: 'Source')
  final String? source;

  @JsonKey(name: 'Value')
  final String? value;

  Rating({
    this.source,
    this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
