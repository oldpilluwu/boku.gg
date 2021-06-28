import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PressableText extends Container {

  PressableText({
    var alignment = Alignment.center,
    required VoidCallback onPressed,
    String unhighlightedText = "",
    required String highlightedText,
  }) :
        super(
          alignment: alignment,
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text.rich(
            TextSpan(
              text: unhighlightedText,
              style: TextStyle(fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                  text: highlightedText,
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPressed,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                // can add more TextSpans here...
              ],
            ),
          )
      );
}