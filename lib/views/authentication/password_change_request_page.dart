import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';

import 'package:boku_gg/views/authentication/widgets/custom_text_field.dart';
import 'package:boku_gg/views/authentication/widgets/positioned_logo.dart';
import 'package:boku_gg/views/authentication/widgets/pressable_texts.dart';
import 'package:boku_gg/views/authentication/widgets/submit_button.dart';

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
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PositionedLogo(),

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
                "Enter your mail and we will send you a link to reset password",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.textColor,
                ),
              ),
            ),

            SizedBox(height: 20),

            CustomTextField(controller: emailController, hintText:  "Email"),


            SizedBox(height: 40),

            SubmitButton(text: 'Send Request', onPressed: () {
              authController.resetPassword(emailController.text);
            },),

            SizedBox(height: 5),

            PressableText(
                onPressed: () {
                  Get.back();
                },
                unhighlightedText: "< ",
                highlightedText: "Back to Login"),


            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
