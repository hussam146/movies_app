

import 'dart:async';
import 'package:cinema_app/movies/presentation/resources/asset_manager.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:cinema_app/movies/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(
      milliseconds: 600
    ), _goNext);
  }

  _goNext(){
    Get.offNamed(Routes.getBase());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey2,
      body: const Center(
        child: Image(
          image: AssetImage(AssetManager.splashImage),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
