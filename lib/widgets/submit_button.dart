
import 'dart:ffi';

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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(45, 12, 45, 12),
            primary: Color(0xff88E079),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          );
}