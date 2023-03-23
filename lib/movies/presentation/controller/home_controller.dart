// ignore_for_file: void_checks, avoid_print

import 'dart:ffi';
import 'package:cinema_app/movies/domain/use_case/now_playing_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/popular_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/top_rated_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/upcoming_use_case.dart';
import 'package:get/get.dart';
import '../../domain/models/movies_model.dart';

class HomeController extends GetxController {
  List<MoviesModel> popular = [];
  List<MoviesModel> nowPlaying = [];
  List<MoviesModel> topRated = [];
  List<MoviesModel> upComing = [];

  final NowPlayingUseCase _nowPlayingUseCase = Get.find();
  final PopularUseCase _popularUseCase = Get.find();
  final TopRatedUseCase _topRatedUseCase = Get.find();
  final UpComingUseCase _upComingUseCase = Get.find();

  HomeController() {
    getNowPlaying();
    getUpComing();
    getTopRated();
    getPopular();
  }

  void getPopular() async {
    final result = await _popularUseCase.execute(Void);
    result.fold((failure) {
      print(failure.message);
    }, (r) {
      popular = r.results;
      update();
    });
  }

  void getNowPlaying() async {
    final result = await _nowPlayingUseCase.execute(Void);
    result.fold((failure) {
      print("Fail Message -> ${failure.message}");
    }, (r) {
      nowPlaying = r.results;
      update();
    });
  }

  void getTopRated() async {
    final result = await _topRatedUseCase.execute(Void);
    result.fold((failure) => {print(failure.message)}, (r) {
      topRated = r.results;
      update();
    });
  }

  void getUpComing() async {
    final result = await _upComingUseCase.execute(Void);
    result.fold((failure) => {print(failure.message)}, (r) {
      upComing = r.results;
      update();
    });
  }
}
