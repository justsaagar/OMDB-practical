import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/enum/api_status.dart';
import 'package:omdb_practical/screens/movie_module/movie_details/movie_details_page.dart';
import 'package:omdb_practical/serializer/movie_details.dart';

class MovieDetailsHelper {
  MovieDetailsPageState state;
  TextEditingController searchController = TextEditingController();
  ApiStatus apiStatus = ApiStatus.initial;
  MovieDetails? movieDetails;
  bool isLoading = false;

  MovieDetailsHelper(this.state) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => searchMovie());
  }

  void updateState() => state.movieController.update();

  Future<void> searchMovie() async {
    apiStatus = ApiStatus.loading;
    updateState();
    String movieId = Get.arguments['movieId'];
    movieDetails = await state.movieController.getMovieDetails(movieId);
    apiStatus = ApiStatus.success;
    updateState();
  }
}
