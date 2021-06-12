import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/controllers/auth_controller.dart';

import 'package:boku_gg/views/password_change_request_page.dart';

import 'package:boku_gg/views/sign_up_page.dart';
import 'package:boku_gg/views/tab_bar_home_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          SizedBox(height: 50),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            alignment: Alignment.center,
            child: Image.asset("assets/iconTransparent.png"),
          )),
          SizedBox(height: 10),

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

          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              style: TextStyle(
                color: ColorPalette.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: ColorPalette.primaryColor.withOpacity(.5),
                ),
                // fillColor: Colors.red,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          // Image(image: image)

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => PasswordChangeRequestPage());
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorPalette.textColor,
                  ),
                ),
              )),
          // ],
          // ),

          SizedBox(height: 40),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                authController.login(
                    emailController.text, passwordController.text);
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(45, 12, 45, 12),
                  primary: Color(0xff88E079),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),

          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register Now!',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => SignUpPage());
                        },
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    // can add more TextSpans here...
                  ],
                ),
              )),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}
