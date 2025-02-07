import 'package:get/get.dart';
import 'package:omdb_practical/app/ui/app_image_expanded%20view.dart';
import 'package:omdb_practical/screens/movie_module/movie_details/movie_details_page.dart';
import 'package:omdb_practical/screens/movie_module/movie_search/movie_search_page.dart';

class RouteConstant {
  static const String initial = '/';
  static const String movieDetails = '/movie-details';
  static const String imageExpansion = '/image-expansion';
}

mixin GetPageRouteHelper {
  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => MovieSearchPage()),
    GetPage(name: RouteConstant.movieDetails, page: () => const MovieDetailsPage()),
    GetPage(name: RouteConstant.imageExpansion, page: () => const AppImageExpandedView()),
  ];
}
