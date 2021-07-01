import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/authentication/widgets/custom_text_field.dart';
import 'package:boku_gg/views/authentication/widgets/positioned_logo.dart';
import 'package:boku_gg/views/authentication/widgets/pressable_texts.dart';
import 'package:boku_gg/views/authentication/widgets/submit_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: _buildContent(),
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

            CustomTextField(controller: emailController, hintText: "Email"),

            CustomTextField(controller: passwordController, hintText: "Password", isPassword: true),

            SizedBox(height: 40),

            SubmitButton(
              text: "Register",
              onPressed: () {
                authController.createUser(
                emailController.text, passwordController.text);
              },
            ),

            PressableText(
                onPressed: () {
                  Get.back();
                },
                unhighlightedText: "Already have an account? ",
                highlightedText: "Sign in."
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
