import 'package:boku_gg/controllers/anime_controller.dart';
import 'package:boku_gg/controllers/auth_controller.dart';
import 'package:boku_gg/controllers/search_controller.dart';
import 'package:boku_gg/views/placeholder_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(AnimeController());
  Get.put(SearchController());
  Get.put(ScrollController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'boku.gg',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          fontFamily: 'Comfortaa'),
      home: PlaceHolderPage(),
    );
  }
}
