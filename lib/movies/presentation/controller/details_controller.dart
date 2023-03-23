// ignore_for_file: avoid_print

import 'package:cinema_app/movies/domain/models/cast_model.dart';
import 'package:cinema_app/movies/domain/models/details_model.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/models/review_model.dart';
import 'package:cinema_app/movies/domain/use_case/cast_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/details_use_case.dart';
import 'package:cinema_app/movies/domain/use_case/review_use_case.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {

  DetailsModel? _detailsModel;
  DetailsModel? get detailsModel => _detailsModel;
  RxList<Review> review = <Review>[].obs;
  List<CastModel> cast = <CastModel>[];
  final DetailsUseCase _detailsUseCase = Get.find();
  final ReviewUseCase _reviewUseCase = Get.find();
  final CastUseCase _castUseCase = Get.find();
  final data = Get.arguments as MoviesModel;

  @override
  void onInit() async{
    await getDetails(data.id);
    await getReview(data.id);
    await getCast(data.id);
    super.onInit();
  }

  getDetails(int id) async {
    final result = await _detailsUseCase.execute(id);
    result.fold((failure) {
      print(failure.message);
    }, (r) {
      _detailsModel = r;
      update();
    });
  }

  getReview(int id) async{
    final response = await _reviewUseCase.execute(id);
    response.fold((failure){
      print(failure.message);
    } , (r){
      review.value = r.results;
    });
  }

  getCast(int id) async{
    final response = await _castUseCase.execute(id);
    response.fold((failure) {print(failure.message);
    }, (r) {
      cast = r.cast;
      update();
    });
  }



}
