import 'package:cinema_app/movies/presentation/controller/base_controller.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  BaseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorManager.grey1,
        body: controller.screens[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.grey1,
          unselectedItemColor: ColorManager.white,
          onTap: (index) {
            controller.changeBottomNavBar(index);
          },
          currentIndex: controller.currentIndex.value,
          items: controller.items,
        ),
      );
    });
  }
}
