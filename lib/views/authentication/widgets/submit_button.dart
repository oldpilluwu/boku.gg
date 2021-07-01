import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/font_resource.dart';
import 'package:flutter/material.dart';

class SubmitButton extends Container {
  SubmitButton({
    required VoidCallback onPressed,
    required String text,
  }) :
        super(
            alignment: Alignment.center,
            child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
            text,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, fontFamily: FontResource.secondaryFont),
            ),
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(45, 12, 45, 12),
            primary: ColorPalette.green,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          );
}