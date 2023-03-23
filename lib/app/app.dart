
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cinema_app/movies/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema_app/movies/presentation/resources/theme_manager.dart';
import 'package:cinema_app/movies/presentation/binding/controller_bindings.dart';
class MyApp extends StatefulWidget {

  // singleTon instance
  MyApp._();

  static final _instance = MyApp._();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.getInit(),
      initialBinding: ControllersBindings(),
      getPages: Routes.routes,
      theme: getAppTheme(),
    );
  }
}
