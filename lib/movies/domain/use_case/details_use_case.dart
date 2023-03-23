

import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/details_model.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:cinema_app/movies/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class DetailsUseCase extends BaseUseCase<int, DetailsModel>{
  final MoviesRepository _repository;

  DetailsUseCase(this._repository);

  @override
  Future<Either<Failure, DetailsModel>> execute(int input) async{
    return await _repository.getDetails(input);
  }
}