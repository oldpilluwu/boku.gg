import 'package:flutter/material.dart';

class EpisodeQuality extends StatelessWidget {
  String quality;
  String link;
  VoidCallback onPressed;

  EpisodeQuality(
      {required this.quality, required this.link, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(quality),
      ),
    );
  }
}
