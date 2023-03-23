

import 'package:cinema_app/movies/presentation/binding/controller_bindings.dart';
import 'package:cinema_app/movies/presentation/binding/home_bindings.dart';
import 'package:cinema_app/movies/presentation/screens/base_screen.dart';
import 'package:cinema_app/movies/presentation/screens/details/details_screen.dart';
import 'package:cinema_app/movies/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashRoute = "/";
  static const String base = "/home";
  static const String details = "/details";

  static String getInit() => splashRoute;

  static String getBase() => base;

  static String getDetails() => details;

  static List<GetPage> routes = [
    GetPage(name: splashRoute, page: () => const SplashScreen()),
    GetPage(
        name: base,
        binding: HomeBindings(),
        page: () => const BaseScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: details,
        binding: ControllersBindings(),
        page: () => DetailsScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
