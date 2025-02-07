import 'package:flutter/material.dart';
import 'package:omdb_practical/app/enum/api_status.dart';
import 'package:omdb_practical/screens/movie_module/movie_search/movie_search_page.dart';
import 'package:omdb_practical/serializer/search_movie.dart';

class MovieSearchHelper {
  MovieSearchPageState state;
  TextEditingController searchController = TextEditingController();
  ApiStatus apiStatus = ApiStatus.initial;
  List<Movie> movieList = <Movie>[];
  bool isLoading = false;

  MovieSearchHelper(this.state);

  void updateState() => state.movieController.update();

  Future<void> searchMovie() async {
    movieList = await state.movieController.getSearchedMovieList(searchController.text);
    updateState();
  }
}
