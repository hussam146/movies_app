
import 'package:cinema_app/movies/data/network/app_api.dart';
import 'package:cinema_app/movies/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<ResultsResponse> getNowPlaying();
  Future<ResultsResponse> getPopular();
  Future<ResultsResponse> getTopRated();
  Future<ResultsResponse> getUpComing();
  Future<DetailsResponse> getDetails(int id);
  Future<ResultReviewResponse> getReviews(int id);
  Future<ResultCastResponse> getCast(int id);
  Future<ResultsResponse> search(String query);
}

class RemoteDataSourceImp implements RemoteDataSource{

  final AppServiceClient _appServiceClient;

  RemoteDataSourceImp(this._appServiceClient);

  @override
  Future<ResultsResponse> getNowPlaying() async{
    return await _appServiceClient.getNowPlaying();
  }

  @override
  Future<ResultsResponse> getPopular() async{
    return await _appServiceClient.getPopular();
  }

  @override
  Future<ResultsResponse> getTopRated() async{
    return await _appServiceClient.getTopRated();
  }

  @override
  Future<ResultsResponse> getUpComing() async{
    return await _appServiceClient.getUpComing();
  }

  @override
  Future<DetailsResponse> getDetails(int id) async{
    return await _appServiceClient.getDetails(id);
  }

  @override
  Future<ResultReviewResponse> getReviews(int id) async{
    return await _appServiceClient.getReviews(id);
  }

  @override
  Future<ResultCastResponse> getCast(int id) async{
    return await _appServiceClient.getCast(id);
  }

  @override
  Future<ResultsResponse> search(String query) async{
    return await _appServiceClient.search(query);
  }
}