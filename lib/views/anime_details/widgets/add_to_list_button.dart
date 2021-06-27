
import 'package:boku_gg/commons/color_palette.dart';
import 'package:flutter/material.dart';

class AddToListButton extends Padding {
  AddToListButton({
    Color color = ColorPalette.secondaryColor,
    required String title,
    required VoidCallback onPressed,
  }) :
        super(
          padding: const EdgeInsets.fromLTRB(40.0, 20, 40, 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            primary: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            textStyle: TextStyle(
              fontSize: 18,
          )),
          onPressed: onPressed,
          child: Container(
              padding: EdgeInsets.all(5),
              width: double.infinity * 0.8,
              child: Text(title, style: TextStyle(color: ColorPalette.primaryColor),),
              alignment: Alignment.center,
          ),
        ),
      );
}