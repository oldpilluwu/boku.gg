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
    Wakelock.enable();
    print("Startinh");
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Container(
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
      ),//
      )),
    );
  }
}

