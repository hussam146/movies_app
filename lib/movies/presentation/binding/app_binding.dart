
import 'package:cinema_app/movies/data/data_source/local_data_source.dart';
import 'package:cinema_app/movies/data/data_source/remote_data_source.dart';
import 'package:cinema_app/movies/data/network/app_api.dart';
import 'package:cinema_app/movies/data/network/dio_factory.dart';
import 'package:cinema_app/movies/data/network/network_info.dart';
import 'package:cinema_app/movies/data/repository/repository.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppBinding extends Bindings{

  @override
  void dependencies() async{
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImp(Get.find()));
    Get.put<LocalDataSource>((LocalDataSourceImp()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
    final dio = await DioFactory().getDio();
    Get.lazyPut<AppServiceClient>(() => AppServiceClient(dio));
    Get.lazyPut<DioFactory>(() => DioFactory());
    Get.put<MoviesRepository>(MoviesRepositoryImp(Get.find(), Get.find()));
  }
}