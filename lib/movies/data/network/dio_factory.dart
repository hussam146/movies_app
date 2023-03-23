

// ignore_for_file: constant_identifier_names

import 'package:cinema_app/app/constants.dart';
import 'package:dio/dio.dart';
const String Application_Json = "application/json";
const String Content_type = "content-type";
const String Accept = "accept";
const String Authorization = "authorization";
const String lang = "en";
class DioFactory{
  Future<Dio> getDio() async{
    Dio dio = Dio();

    Map<String, dynamic> headers = {
      Content_type: Application_Json,
      Accept: Application_Json,
      Authorization: Constants.token,
      lang: "en",
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseURL,
      headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut
    );
    return dio;
  }
}