import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/enum/api_status.dart';
import 'package:omdb_practical/app/ui/app_image_asset.dart';
import 'package:omdb_practical/app/ui/app_loader.dart';
import 'package:omdb_practical/controller/movie_controller.dart';
import 'package:omdb_practical/screens/movie_module/movie_details/movie_details_helper.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => MovieDetailsPageState();
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsHelper? movieDetailsHelper;
  late MovieController movieController;

  @override
  Widget build(BuildContext context) {
    movieDetailsHelper ?? (movieDetailsHelper = MovieDetailsHelper(this));
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (movieController) {
        this.movieController = movieController;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              movieDetailsHelper?.movieDetails?.title ?? '',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Colors.deepPurple.withValues(alpha: 0.5),
          ),
          body: Stack(
            children: [
              movieDetailsHelper?.movieDetails == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Hero(
                            tag: "moviePoster",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AppImageAsset(
                                image: movieDetailsHelper?.movieDetails?.poster ?? '',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(16.0),
                              children: [
                                Text(
                                  "${movieDetailsHelper?.movieDetails?.title} (${movieDetailsHelper?.movieDetails?.year})",
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: [
                                    if (movieDetailsHelper?.movieDetails?.ratings.isNotEmpty ?? false) ...[
                                      Icon(Icons.star, color: Colors.yellow),
                                      SizedBox(width: 5),
                                      Text("IMDb: ${movieDetailsHelper?.movieDetails?.ratings[0].value}"),
                                    ],
                                    Spacer(),
                                    if ((movieDetailsHelper?.movieDetails?.ratings.length ?? 0) > 1) ...[
                                      Icon(Icons.local_movies, color: Colors.red),
                                      SizedBox(width: 5),
                                      Text("RT: ${movieDetailsHelper?.movieDetails?.ratings[1].value}"),
                                    ],
                                  ],
                                ),
                                SizedBox(height: 16),
                                _infoRow("Genre", movieDetailsHelper?.movieDetails?.genre),
                                _infoRow("Director", movieDetailsHelper?.movieDetails?.director),
                                _infoRow("Writer", movieDetailsHelper?.movieDetails?.writer),
                                _infoRow("Actors", movieDetailsHelper?.movieDetails?.actors),
                                _infoRow("Language", movieDetailsHelper?.movieDetails?.language),
                                _infoRow("Awards", movieDetailsHelper?.movieDetails?.awards),
                                SizedBox(height: 16),
                                Text("Plot", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(movieDetailsHelper?.movieDetails?.plot ?? '', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              if (movieDetailsHelper?.apiStatus == ApiStatus.loading) const AppLoader(),
            ],
          ),
        );
      },
    );
  }

  Widget _infoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? '')),
        ],
      ),
    );
  }
}
