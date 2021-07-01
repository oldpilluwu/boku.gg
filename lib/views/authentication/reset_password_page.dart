import 'package:boku_gg/commons/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class ResetPasswordPage extends StatelessWidget {
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
              )
          ),
          SizedBox(height: 10),

          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration:
            BoxDecoration(
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),

            child: TextField(
              onSubmitted: (text) {},
              style: TextStyle(
                color: ColorPalette.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "New password",
                hintStyle: TextStyle(
                  color: ColorPalette.primaryColor.withOpacity(.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
            decoration:
            BoxDecoration(
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),

            child: TextField(
              onSubmitted: (text) {},
              style: TextStyle(
                color: ColorPalette.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "Confirm password",
                hintStyle: TextStyle(
                  color: ColorPalette.primaryColor.withOpacity(.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          // Image(image: image)

          SizedBox(height: 50),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: Text("Reset Password", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(45, 12, 45, 12),
                  primary: Color(0xff88E079),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
              ),
            ),
          ),
          SizedBox(height: 160),

        ],
      ),
    );
  }
}
