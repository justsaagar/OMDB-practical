import 'package:get/get.dart';
import 'package:omdb_practical/app/routes/route_constant.dart';

class RouteHelper {
  static final RouteHelper instance = RouteHelper._internal();

  factory RouteHelper() => instance;

  RouteHelper._internal();

  void goToMovieDetails() => Get.toNamed(RouteConstant.movieDetails);
}
