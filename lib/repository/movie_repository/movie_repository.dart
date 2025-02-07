import 'package:omdb_practical/serializer/search_movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> searchMovie(String movieName);

  Future<Movie> getMovieDetails(String movieId);
}
