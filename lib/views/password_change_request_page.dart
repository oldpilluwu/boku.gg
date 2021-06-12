import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';

import 'package:boku_gg/views/reset_password_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangeRequestPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: _buildContent(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildContent() {
    return SafeArea(
      // padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            alignment: Alignment.center,
            child: Image.asset("assets/iconTransparent.png"),
          )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Text(
              "Forgot your password?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorPalette.textColor,
              ),
            ),
          ),

          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Text(
              "Enter you mail and we will send you a link to reset password",
              style: TextStyle(
                fontSize: 16,
                color: ColorPalette.textColor,
              ),
            ),
          ),

          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: emailController,
              style: TextStyle(
                color: ColorPalette.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: ColorPalette.primaryColor.withOpacity(.5),
                ),
                // fillColor: Colors.red,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [

          SizedBox(height: 40),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                authController.resetPassword(emailController.text);
              },
              child: Text(
                "Send Request",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(35, 12, 35, 12),
                  primary: Color(0xff88E079),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),

          SizedBox(height: 5),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "< Back to Login",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorPalette.textColor,
                  ),
                ),
              )),

          SizedBox(height: 120),
        ],
      ),
    );
  }
}
