import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/views/video_player/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpisodeQuality extends StatelessWidget {
  final String quality;
  final String link;
  final VoidCallback onPressed;

  EpisodeQuality(
      {required this.quality, required this.link, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String slicedQualityText =
        (quality.replaceAll(" - mp4)", "")).replaceAll("(", "");
    if (slicedQualityText == "HDP") slicedQualityText = "HDP (Recommmended)";
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.secondaryColor),
            borderRadius: BorderRadius.circular(25)),
        height: 60,
        // color: ColorPalette.secondaryColor,
        padding: EdgeInsets.fromLTRB(15, 22, 15, 15),
        child: Text(
          slicedQualityText,
          style: TextStyle(color: ColorPalette.textColor),
        ),
      ),
    );
  }
}
