


import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:cinema_app/movies/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase extends BaseUseCase<String, ResultsModel>{
  final MoviesRepository _repository;
  SearchUseCase(this._repository);

  @override
  Future<Either<Failure, ResultsModel>> execute(String input) async{
    return await _repository.search(input);
  }


}