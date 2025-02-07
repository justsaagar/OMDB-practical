import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:omdb_practical/app/constant/string_constants.dart';
import 'package:omdb_practical/app/helper/extension_helper.dart';
import 'package:omdb_practical/app/helper/rest_helper.dart';
import 'package:omdb_practical/repository/movie_repository/movie_repository.dart';
import 'package:omdb_practical/serializer/movie_details.dart';
import 'package:omdb_practical/serializer/search_movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<Movie>> searchMovie(String movieName) async {
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: '${RestConstants.instance.apiKey}${StringConstants.apiKey}',
        addOns: '&s=$movieName',
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('Response') && responseMap['Response'] == 'True') {
          SearchMovie ticketReportModel = SearchMovie.fromJson(jsonDecode(response));
          return ticketReportModel.search;
        } else {
          responseMap['Error'].toString().showError();
        }
      }
    } on SocketException catch (e) {
      'Catch SocketException in searchMovie --> ${e.message}'.logs();
    }
    return [];
  }

  @override
  Future<MovieDetails?> getMovieDetails(String movieId) async {
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: '${RestConstants.instance.apiKey}${StringConstants.apiKey}',
        addOns: '&i=$movieId',
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('Response') && responseMap['Response'] == 'True') {
          MovieDetails ticketReportModel = MovieDetails.fromJson(jsonDecode(response));
          return ticketReportModel;
        }
      }
    } on SocketException catch (e) {
      'Catch SocketException in searchMovie --> ${e.message}'.logs();
    }
    return null;
  }
}
