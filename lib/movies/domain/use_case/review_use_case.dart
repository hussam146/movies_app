

import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/review_model.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:cinema_app/movies/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class ReviewUseCase extends BaseUseCase<int, ResultReview>{
  final MoviesRepository _repository;

  ReviewUseCase(this._repository);

  @override
  Future<Either<Failure, ResultReview>> execute(int input) async{
    return await _repository.getReviews(input);
  }
}