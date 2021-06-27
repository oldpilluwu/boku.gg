import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/controllers/auth_controller.dart';

import 'package:boku_gg/views/authentication/password_change_request_page.dart';

import 'package:boku_gg/views/authentication/sign_up_page.dart';
import 'package:boku_gg/widgets/custom_text_field.dart';
import 'package:boku_gg/widgets/positioned_logo.dart';
import 'package:boku_gg/widgets/pressable_texts.dart';
import 'package:boku_gg/widgets/submit_button.dart';

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
      // resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            PositionedLogo(),

            SizedBox(height: 10),

            CustomTextField(controller: emailController, hintText: "Email"),

            CustomTextField(controller: passwordController, hintText: "Password", isPassword: true),

            PressableText(
              alignment: Alignment.bottomRight,
              onPressed: () {
                Get.to(() => PasswordChangeRequestPage());
              },
              highlightedText: "Forgot Password?",
            ),


            SizedBox(height: 40),

            SubmitButton(
                text: "Login",
                onPressed: () {
                  authController.login(
                  emailController.text, passwordController.text);
                },
            ),

            PressableText(
                onPressed: () {
                  Get.to(() => SignUpPage());
                },
                highlightedText: "Register Now",
                unhighlightedText: "Don't have an account? ",
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
