import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/enum/api_status.dart';
import 'package:omdb_practical/app/ui/app_image_asset.dart';
import 'package:omdb_practical/app/ui/app_loader.dart';
import 'package:omdb_practical/controller/movie_controller.dart';
import 'package:omdb_practical/screens/movie_module/movie_search/movie_search_helper.dart';
import 'package:omdb_practical/serializer/search_movie.dart';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => MovieSearchPageState();
}

class MovieSearchPageState extends State<MovieSearchPage> {
  late MovieController movieController;
  MovieSearchHelper? movieSearchHelper;

  @override
  Widget build(BuildContext context) {
    movieSearchHelper ?? (movieSearchHelper = MovieSearchHelper(this));
    return Scaffold(
      appBar: AppBar(
        title: Text('OMDB search'),
        elevation: 0,
        backgroundColor: Colors.pink.withValues(alpha: 0.5),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (movieController) {
          this.movieController = movieController;
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: movieSearchHelper?.searchController,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        movieSearchHelper?.searchMovie();
                      },
                      decoration: InputDecoration(
                        labelText: 'Search Movies...',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => movieSearchHelper?.searchMovie(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ((movieSearchHelper?.searchController.text.isNotEmpty ?? true) && (movieSearchHelper?.movieList.isEmpty ?? true))
                        ? Center(
                            child: Text('Movie not found!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: movieSearchHelper?.movieList.length ?? 0,
                            itemBuilder: (context, index) {
                              final Movie? movie = movieSearchHelper?.movieList[index];
                              if (movie == null) return SizedBox();
                              return InkWell(
                                onTap: () => movieSearchHelper?.manageMovie(movie),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: AppImageAsset(
                                          image: movie.networkUrl ? movie.poster ?? '' : 'assets/icons/film-slate.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie.title ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(movie.year ?? '', style: TextStyle(fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 16),
                          ),
                  ),
                ],
              ),
              if (movieSearchHelper?.apiStatus == ApiStatus.loading) AppLoader(),
            ],
          );
        },
      ),
    );
  }
}
