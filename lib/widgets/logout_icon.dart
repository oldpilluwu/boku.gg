import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Logout",
            titleStyle: TextStyle(fontSize: 22),
            middleText: "Are you sure you want to log out?",
            textCancel: "No",
            textConfirm: "Yes",
            onCancel: () {},
            onConfirm: () {
              authController.signOut();
              Navigator.of(context).pop();
            });
      },
      icon: Icon(Icons.logout),
    );
  }
}
