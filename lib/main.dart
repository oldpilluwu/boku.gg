import 'package:boku_gg/controllers/anime_controller.dart';
import 'package:boku_gg/controllers/search_controller.dart';
import 'package:boku_gg/views/browse_page.dart';
import 'package:boku_gg/views/home_page.dart';
import 'package:boku_gg/views/placeholder_page.dart';
import 'package:boku_gg/views/search_result.dart';
import 'package:boku_gg/views/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(AnimeController());
  Get.put(SearchController());
  Get.put(ScrollController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'boku.gg',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          fontFamily: 'Comfortaa'),
      home: TabBarHomePage(),
    );
  }
}
