

import 'package:cinema_app/movies/presentation/controller/base_controller.dart';
import 'package:cinema_app/movies/presentation/controller/details_controller.dart';
import 'package:cinema_app/movies/presentation/controller/home_controller.dart';
import 'package:cinema_app/movies/presentation/controller/search_controller.dart';
import 'package:cinema_app/movies/presentation/controller/watch_list_controller.dart';
import 'package:get/get.dart';

class ControllersBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailsController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => WatchListController());
  }
}