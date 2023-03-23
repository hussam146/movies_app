


import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/use_case/search_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  RxList<MoviesModel> searchList = <MoviesModel>[].obs;
  final SearchUseCase _searchUseCase = Get.find();
  final ValueNotifier<bool> _load = ValueNotifier<bool>(true);
  ValueNotifier<bool> get load => _load;


  void search(String query) async{
    _load.value = false;
    final response = await _searchUseCase.execute(query);
    response.fold((failure) {
    }, (data) {
      _load.value = true;
      searchList.value = data.results;
    });
  }
}