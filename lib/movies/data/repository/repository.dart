
import 'package:cinema_app/movies/data/data_source/remote_data_source.dart';
import 'package:cinema_app/movies/data/mappers/mappers.dart';
import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:cinema_app/movies/data/network/network_info.dart';
import 'package:cinema_app/movies/domain/models/cast_model.dart';
import 'package:cinema_app/movies/domain/models/details_model.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/models/review_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/movies_repository.dart';
import '../network/error_handler.dart';

class MoviesRepositoryImp implements MoviesRepository{

  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  MoviesRepositoryImp(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ResultsModel>> getNowPlaying() async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getNowPlaying();
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }
        else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultsModel>> getPopular() async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getPopular();
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }
        else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, ResultsModel>> getTopRated() async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getTopRated();
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }
        else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, ResultsModel>> getUpComing() async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getUpComing();
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }
        else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, DetailsModel>> getDetails(int id) async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getDetails(id);
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }
      catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, ResultReview>> getReviews(int id) async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getReviews(id);
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }
      catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ResultCast>> getCast(int id) async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.getCast(id);
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }
      catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, ResultsModel>> search(String query) async{
    if(await _networkInfo.icConnected){// success connect to internet
      try{
        final response = await _remoteDataSource.search(query);
        if(ResponseStatus.success){// success response
          return Right(response.toDomain());
        }else{
          return Left(DataSource.RESPONSE.getFailure());
        }
      }
      catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else{// no internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}