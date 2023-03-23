


import 'package:cinema_app/movies/domain/use_case/cast_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/details_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/now_playing_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/popular_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/review_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/search_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/top_rated_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/upcoming_use_case.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TopRatedUseCase(Get.find()));
    Get.lazyPut(() => PopularUseCase(Get.find()));
    Get.lazyPut(() => NowPlayingUseCase(Get.find()));
    Get.lazyPut(() => UpComingUseCase(Get.find()));
    Get.lazyPut(() => DetailsUseCase(Get.find()));
    Get.lazyPut(() => ReviewUseCase(Get.find()));
    Get.lazyPut(() => CastUseCase(Get.find()));
    Get.lazyPut(() => SearchUseCase(Get.find()));
  }

}