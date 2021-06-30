import 'package:boku_gg/commons/color_palette.dart';
import 'package:flutter/material.dart';

class EpisodeQuality extends StatelessWidget {
  final String quality;
  final String link;
  final VoidCallback onPressed;

  EpisodeQuality(
      {required this.quality, required this.link, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.secondaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(50)),
        height: 60,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Center(
          child: Row(
            children: [
              Expanded(flex: 7, child: Container()),
              Expanded(flex: 2, child: Icon(Icons.play_circle_outlined, color: ColorPalette.red,)),
              Expanded(
                  flex: 2,
                  child: Text(
                quality,
                style: TextStyle(color: ColorPalette.textColor, fontSize: 18),
              )),
              Expanded(flex: 7, child: Container()),

            ],
          ),
        ),
      ),
    );
  }
}
