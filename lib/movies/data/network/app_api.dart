

import 'package:cinema_app/app/constants.dart';
import 'package:cinema_app/movies/data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/movie/now_playing?api_key=${Constants.apiKey}")
  Future<ResultsResponse> getNowPlaying();

  @GET("/movie/popular?api_key=${Constants.apiKey}")
  Future<ResultsResponse> getPopular();

  @GET("/movie/top_rated?api_key=${Constants.apiKey}")
  Future<ResultsResponse> getTopRated();

  @GET("/movie/upcoming?api_key=${Constants.apiKey}")
  Future<ResultsResponse> getUpComing();

  @GET("/movie/movieId?api_key=${Constants.apiKey}")
  Future<DetailsResponse> getDetails(
      @Field("movie_id") int movieId
      );

  @GET("/movie/movieId/reviews?api_key=${Constants.apiKey}")
  Future<ResultReviewResponse> getReviews(
      @Field("movie_id") int movieId
      );

  @GET("/movie/movieId/credits?api_key=${Constants.apiKey}")
  Future<ResultCastResponse> getCast(
      @Field("movie_id") int movieId
      );

  @GET("/search/movie?api_key=${Constants.apiKey}&query=query")
  Future<ResultsResponse> search(
      @Field("movie_id") String query
      );

}