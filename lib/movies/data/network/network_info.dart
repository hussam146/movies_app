


import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get icConnected;
}


class NetworkInfoImp implements NetworkInfo{

  final InternetConnectionChecker _connectionChecker;

  NetworkInfoImp(this._connectionChecker);
  @override
  Future<bool> get icConnected => _connectionChecker.hasConnection;


}