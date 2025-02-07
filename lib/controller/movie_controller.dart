import 'package:get/get.dart';
import 'package:omdb_practical/main.dart';
import 'package:omdb_practical/repository/movie_repository/movie_repository.dart';
import 'package:omdb_practical/serializer/search_movie.dart';

class MovieController extends GetxController {
  MovieRepository movieRepository = getIt.get<MovieRepository>();

  Future<List<Movie>> getSearchedMovieList(String movieName) async {
    return await movieRepository.searchMovie(movieName);
  }
}
