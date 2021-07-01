
import 'package:boku_gg/commons/font_resource.dart';
import 'package:flutter/material.dart';

class GenreButton extends SizedBox {
  GenreButton({
    double height = 80,
    double width = 120,
    Color textColor = Colors.black87,
    double borderRadius = 8,
    double fontSize = 16,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) :
      super(
          child: ElevatedButton(
            onPressed: onPressed,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(title,
                style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500, fontFamily: FontResource.secondaryFont),
                textAlign: TextAlign.center,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
            ),
          )
      );
}