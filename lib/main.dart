import 'package:cinema_app/movies/data/data_source/local_data_source.dart';
import 'package:cinema_app/movies/presentation/binding/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'movies/domain/models/movies_model.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MoviesModelAdapter());
  await LocalDataSourceImp().openBox();
  // di of data layer
  AppBinding().dependencies();
  runApp(MyApp());
}
