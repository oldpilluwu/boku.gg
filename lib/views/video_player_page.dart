import 'package:boku_gg/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({
    required this.videoLink,
  }) : super();
  final String videoLink;

  String returnLink() {
    return this.videoLink;
  }

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videoLink)
      ..addListener(() => setState(   () {}   ))
      ..setLooping(false)
      ..initialize().then((_) => controller..play());
    setLandscape();
  }


  void dispose() {
    controller.dispose();
    super.dispose();
    setAllOrientations();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }


  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    await Wakelock.disable();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff282828),
        body: VideoPlayerWidget(controller: controller));
  }
}