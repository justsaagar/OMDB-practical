import 'package:json_annotation/json_annotation.dart';

part 'search_movie.g.dart';

@JsonSerializable()
class SearchMovie {
  @JsonKey(name: 'Search')
  final List<Movie> search;

  @JsonKey(name: 'totalResults')
  final String? totalResults;

  @JsonKey(name: 'Response')
  final String? response;

  SearchMovie({
    this.search = const <Movie>[],
    this.totalResults,
    this.response,
  });

  factory SearchMovie.fromJson(Map<String, dynamic> json) => _$SearchMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);
}

@JsonSerializable()
class Movie {
  @JsonKey(name: 'Title')
  final String? title;

  @JsonKey(name: 'Year')
  final String? year;

  @JsonKey(name: 'imdbID')
  final String? imdbID;

  @JsonKey(name: 'Type')
  final String? type;

  @JsonKey(name: 'Poster')
  final String? poster;

  Movie({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  bool get networkUrl => poster != null && poster != "N/A";
}
