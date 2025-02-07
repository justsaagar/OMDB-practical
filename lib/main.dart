import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/routes/route_constant.dart';
import 'package:omdb_practical/repository/movie_repository/movie_repository.dart';
import 'package:omdb_practical/repository/movie_repository/movie_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HelpdeskApp',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.initial,
      defaultTransition: Transition.fadeIn,
      getPages: GetPageRouteHelper.routes,
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? Container(),
        );
        return child;
      },
    );
  }
}
