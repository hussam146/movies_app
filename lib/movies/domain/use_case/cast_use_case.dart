

import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/cast_model.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:cinema_app/movies/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class CastUseCase extends BaseUseCase<int, ResultCast>{
  final MoviesRepository _repository;

  CastUseCase(this._repository);

  @override
  Future<Either<Failure, ResultCast>> execute(int input) async{
    return await _repository.getCast(input);
  }


}