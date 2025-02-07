import 'package:get/get.dart';
import 'package:omdb_practical/app/routes/route_constant.dart';

class RouteHelper {
  static final RouteHelper instance = RouteHelper._internal();

  factory RouteHelper() => instance;

  RouteHelper._internal();

  void goToMovieDetails(String movieId) => Get.toNamed(RouteConstant.movieDetails, arguments: {'movieId': movieId});
}
