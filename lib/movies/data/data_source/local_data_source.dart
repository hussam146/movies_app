


import 'package:cinema_app/app/constants.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
// using hive to store data
abstract class LocalDataSource {
  Future<Box> openBox();
  List<MoviesModel> getWatchList(Box box);
  Future<void> addToWatchList(Box box, MoviesModel model);
  Future<void> removeFromWatchList(Box box, MoviesModel model);
  Future<void> clearWatchList(Box box);
}

class LocalDataSourceImp implements LocalDataSource{


  @override
  Future<Box> openBox() async{
    Box box = await Hive.openBox(Constants.hiveBox);
    return box;
  }

  @override
  Future<void> addToWatchList(Box box, MoviesModel model) async{
    await box.put(model.id, model);
  }

  @override
  List<MoviesModel> getWatchList(Box box) {
    return box.values.cast<MoviesModel>().toList();
  }

  @override
  Future<void> removeFromWatchList(Box box, MoviesModel model) async{
    await box.delete(model.id);
  }
  @override
  Future<void> clearWatchList(Box box) async{
    await box.clear();
  }
}

