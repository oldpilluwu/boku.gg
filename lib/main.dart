import 'package:boku_gg/controllers/anime_controller.dart';
import 'package:boku_gg/controllers/auth_controller.dart';
import 'package:boku_gg/controllers/library_controller.dart';
import 'package:boku_gg/controllers/search_controller.dart';
import 'package:boku_gg/views/placeholder_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
  Get.put(AuthController());
  Get.put(LibraryController());
  Get.put(AnimeController());
  Get.put(SearchController());
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
