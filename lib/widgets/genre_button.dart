
import 'package:flutter/material.dart';

class GenreButton extends SizedBox {
  GenreButton({
    double height = 80,
    double width = 120,
    Color textColor = Colors.black87,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) :
      super(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title,
              style: TextStyle(color: textColor, fontSize: 14.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)))
            ),
          )
      );
}