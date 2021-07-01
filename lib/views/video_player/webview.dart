import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  bool isOnLandscape(BuildContext context){
    if(MediaQuery.of(context).orientation == Orientation.landscape)
      return true;
    else  return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          children: [
            Expanded(flex: isOnLandscape(context) ? 0 : 100 , child: Container()),
            Expanded(
              flex: 90,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: GestureDetector(
                    onVerticalDragUpdate: (update) {},
                    child: AspectRatio(
                      aspectRatio: isOnLandscape(context) ? 16/9 : 4/3,
                      child: WebView(
                      initialUrl: widget.link,
                      javascriptMode: JavascriptMode.unrestricted,
                      navigationDelegate: (NavigationRequest request) {
                      return NavigationDecision.prevent;},
                      ),
                    ),
                ),
              ),
            ),
            Expanded(flex: isOnLandscape(context) ? 0 : 100 , child: Container()),
          ],
        )
    );
  }
}
