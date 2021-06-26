import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewVideoPlayer extends StatefulWidget {
  WebViewVideoPlayer({
    required this.link});

  String link;
  @override
  WebViewVideoPlayerState createState() => WebViewVideoPlayerState();
}

class WebViewVideoPlayerState extends State<WebViewVideoPlayer> {
  // String link = widget.link;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.link,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest request) {
        return NavigationDecision.prevent;
      },
    );
  }
}