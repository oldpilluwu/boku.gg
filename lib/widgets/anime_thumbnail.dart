import 'package:flutter/material.dart';

class AnimeThumbnail extends FloatingActionButton {
  AnimeThumbnail({
    Color textColor = Colors.white,
    required String imageLink,
    required id,
    required String title,
    required VoidCallback onPressed,
  }) :
        super(
          onPressed: onPressed,
          child: SizedBox(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: NetworkImage(imageLink),
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),

                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black45
                      ],
                    ),
                  ),
                  child: Text(title,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          )
      );
}