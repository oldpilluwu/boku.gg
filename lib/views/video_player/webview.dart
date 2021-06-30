import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewVideoPlayer extends StatefulWidget {
  WebViewVideoPlayer({
    required this.link});

  final String link;
  @override
  WebViewVideoPlayerState createState() => WebViewVideoPlayerState();
}

class WebViewVideoPlayerState extends State<WebViewVideoPlayer> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    setLandscape();
  }

  void dispose() {
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
    return SafeArea(
      child: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 16/9,
          child: WebView(
            initialUrl: widget.link,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              return NavigationDecision.prevent;
            },
          ),
        ),
      ),
    );
  }
}