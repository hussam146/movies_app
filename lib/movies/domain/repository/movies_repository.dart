


import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/cast_model.dart';
import 'package:cinema_app/movies/domain/models/details_model.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/models/review_model.dart';
import 'package:dartz/dartz.dart';
abstract class MoviesRepository{
  Future<Either<Failure, ResultsModel>> getPopular();
  Future<Either<Failure, ResultsModel>> getNowPlaying();
  Future<Either<Failure, ResultsModel>> getTopRated();
  Future<Either<Failure, ResultsModel>> getUpComing();
  Future<Either<Failure, DetailsModel>> getDetails(int id);
  Future<Either<Failure, ResultReview>> getReviews(int id);
  Future<Either<Failure, ResultCast>> getCast(int id);
  Future<Either<Failure, ResultsModel>> search(String query);
}