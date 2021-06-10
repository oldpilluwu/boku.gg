import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerOverlay({
    required this.controller
  }) :
        super();

  String getPosition() {
    final duration = Duration(
        milliseconds: controller.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(controller.value.isPlaying)
          controller.pause();
        else controller.play();
      },
      child: Stack(
        children: <Widget>[
          buildPlay(),

          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: buildIndicator()),

          Positioned(
            bottom: 1,
            left: 22,
            child: Text(getPosition(),
                style: TextStyle(
                  color: Color(0xffdedede),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {

    return Container(
        height: 22,
        child: VideoProgressIndicator(
          controller, allowScrubbing: true,
          colors: VideoProgressColors(
              playedColor: Colors.red.withOpacity(.6)
          ),));
  }

  Widget buildPlay() {
    if (controller.value.isPlaying)
      return Container();

    else return Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: Icon(Icons.play_arrow,
      color: Colors.white, size: 80.0,),
    );

  }
}
