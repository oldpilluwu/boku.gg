import 'package:boku_gg/widgets/video_player_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    required this.controller,
  }) : super();

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(alignment: Alignment.center, child: buildVideo())
      : Container(
          child: Center(
          child: CircularProgressIndicator(),
        ));

  Widget buildVideo() => Stack(children: <Widget>[
        buildVideoPlayer(),
        VideoPlayerOverlay(controller: controller),
      ]);

  Widget buildVideoPlayer() => Center(
        child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller)),
      );
}
