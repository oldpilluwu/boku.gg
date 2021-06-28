import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeThumbnail extends GestureDetector {
  AnimeThumbnail({
    Color textColor = Colors.white,
    required String imageLink,
    required id,
    required String title,
    required VoidCallback onPressed,
  }) : super(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: imageLink,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),

                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
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
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      textAlign: TextAlign.start,
                    ),
                  )
  ),
                ],
              ),
            ));
}
