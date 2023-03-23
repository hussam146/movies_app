
import 'package:cinema_app/movies/presentation/screens/home/home_screen.dart';
import 'package:cinema_app/movies/presentation/screens/search/search_screen.dart';
import 'package:cinema_app/movies/presentation/screens/watch_list/watch_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxList<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen()
  ].obs;

  RxList<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
    BottomNavigationBarItem(
        icon: Icon(Icons.label_important_outline), label: "Watch List"),
  ].obs;

  void changeBottomNavBar(int index){
    currentIndex.value = index;
  }
}
