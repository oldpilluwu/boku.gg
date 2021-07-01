import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/home/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication/login_page.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.user != null) {
        libraryController.getUserLibrary(authController.user!.uid);
      }
      return (authController.user != null) ? TabBarHomePage() : LoginPage();
    });
  }
}
