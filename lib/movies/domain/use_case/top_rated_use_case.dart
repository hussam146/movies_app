




import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/repository/movies_repository.dart';
import 'package:cinema_app/movies/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class TopRatedUseCase extends BaseUseCase<void, ResultsModel>{

  final MoviesRepository _repository;
  TopRatedUseCase(this._repository);
  @override
  Future<Either<Failure, ResultsModel>> execute(void input) async{
    return await _repository.getTopRated();
  }
}