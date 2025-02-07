import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/helper/extension_helper.dart';
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
      appBar: AppBar(title: Text("Movie Search")),
      body: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (movieController) {
          this.movieController = movieController;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: movieSearchHelper?.searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Movies...',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        'sdsd'.logs();
                        movieSearchHelper?.searchMovie();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: movieSearchHelper?.movieList.length ?? 0,
                  itemBuilder: (context, index) {
                    final Movie? movie = movieSearchHelper?.movieList[index];
                    if (movie == null) return SizedBox();
                    return ListTile(
                      leading: Image.network(
                        (movie.poster!.isNotEmpty && movie.poster != 'N/A')
                            ? movie.poster ?? ''
                            : 'https://via.placeholder.com/150',
                        width: 50,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://via.placeholder.com/150',
                            width: 50,
                            height: 80,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      title: Text(movie.title ?? ''),
                      subtitle: Text(movie.year ?? ''),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
