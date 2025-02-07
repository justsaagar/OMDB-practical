import 'package:omdb_practical/serializer/movie_details.dart';
import 'package:omdb_practical/serializer/search_movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> searchMovie(String movieName);

  Future<MovieDetails?> getMovieDetails(String movieId);
}
