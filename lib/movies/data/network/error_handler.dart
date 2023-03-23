// ignore_for_file: constant_identifier_names

import 'package:cinema_app/movies/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    // internal server error
    case DioErrorType.connectTimeout:
      return DataSource.CONNECTION_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
      // remote error from api
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null
      ) {
        return Failure(
          ResponseStatus.fail,
          error.response?.statusMessage ?? ResponseMessages.RESPONSE,
          error.response?.statusCode ?? ResponseCodes.RESPONSE,
        );
      }
      else {
        return DataSource.DEFAULT.getFailure();
      }
  }
}

enum DataSource {
  SUCCESS,
  UNAUTHORIZED,
  NOT_FOUND,
  CONNECTION_TIMEOUT,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CANCEL,
  DEFAULT,
  NO_INTERNET_CONNECTION,
  CACHE_ERROR,
  RESPONSE
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseStatus.fail, ResponseMessages.SUCCESS,
            ResponseCodes.SUCCESS);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseStatus.fail, ResponseMessages.UNAUTHORIZED,
            ResponseCodes.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseStatus.fail, ResponseMessages.NOT_FOUND,
            ResponseCodes.NOT_FOUND);
      case DataSource.CONNECTION_TIMEOUT:
        return Failure(ResponseStatus.fail, ResponseMessages.CONNECTION_TIMEOUT,
            ResponseCodes.CONNECTION_TIMEOUT);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(ResponseStatus.fail, ResponseMessages.RECEIVE_TIMEOUT,
            ResponseCodes.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseStatus.fail, ResponseMessages.SEND_TIMEOUT,
            ResponseCodes.SEND_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(
            ResponseStatus.fail, ResponseMessages.CANCEL, ResponseCodes.CANCEL);
      case DataSource.DEFAULT:
        return Failure(ResponseStatus.fail, ResponseMessages.DEFAULT,
            ResponseCodes.DEFAULT);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            ResponseStatus.fail,
            ResponseMessages.NO_INTERNET_CONNECTION,
            ResponseCodes.NO_INTERNET_CONNECTION);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseStatus.fail, ResponseMessages.CACHE_ERROR,
            ResponseCodes.CACHE_ERROR);
      case DataSource.RESPONSE:
        return Failure(ResponseStatus.fail, ResponseMessages.RESPONSE,
            ResponseCodes.RESPONSE);
      default:
        return Failure(ResponseStatus.fail, ResponseMessages.DEFAULT,
            ResponseCodes.DEFAULT);
    }
  }
}

class ResponseCodes {
  static const int SUCCESS = 200;
  static const int UNAUTHORIZED = 401;
  static const int NOT_FOUND = 404;
  static const int DEFAULT = 404;
  static const int CONNECTION_TIMEOUT = 522;
  static const int CANCEL = 499;
  static const int RECEIVE_TIMEOUT = 408;
  static const int SEND_TIMEOUT = 408;
  static const int CACHE_ERROR = 598;
  static const int NO_INTERNET_CONNECTION = 522;
  static const int RESPONSE = 402;
}

class ResponseMessages {
  static const String SUCCESS = "success";
  static const String UNAUTHORIZED =
      "request didn't completed, not valid authentication data";
  static const String NOT_FOUND = "sources not even valid";
  static const String DEFAULT = "something went wrong";
  static const String CONNECTION_TIMEOUT = "time out error";
  static const String CANCEL = "request canceled";
  static const String RECEIVE_TIMEOUT = "time out error";
  static const String SEND_TIMEOUT = "time out error";
  static const String CACHE_ERROR = "cache error";
  static const String NO_INTERNET_CONNECTION =
      "please check your internet connection";
  static const String RESPONSE = "something went wrong";
}

class ResponseStatus {
  static const bool success = true;
  static const bool fail = false;
}
