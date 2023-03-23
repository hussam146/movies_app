
import 'package:cinema_app/app/constants.dart';
import 'package:cinema_app/movies/data/data_source/local_data_source.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class WatchListController extends GetxController{

  RxList<MoviesModel> movies = <MoviesModel>[].obs;

  LocalDataSource localDataSource = Get.find();


  @override
  void onInit() async{
    await getWatchList();
    super.onInit();
  }


  addToWatchList(MoviesModel model) async{
    for(int i =0; i < movies.length; i++){
      if(movies[i].id == model.id){
        return ;
      }
    }
    localDataSource.addToWatchList(Hive.box(Constants.hiveBox), model);
    movies.add(model);
  }

  getWatchList() async{
    movies.value = localDataSource.getWatchList(Hive.box(Constants.hiveBox));
  }

  deleteItem(MoviesModel model) async{
    await localDataSource.removeFromWatchList(Hive.box(Constants.hiveBox), model);
    movies.remove(model);
    await getWatchList();
  }
}