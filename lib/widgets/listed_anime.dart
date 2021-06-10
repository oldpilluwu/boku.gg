
import 'package:boku_gg/commons/color_palette.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListedAnime extends GestureDetector {
  ListedAnime({
    Color bgColor = ColorPalette.secondaryColorDark,
    required String title,
    required String id,
    required String imageLink,
    required VoidCallback onPressed,
  }) :
        super  (
          onTap: onPressed,
          child: Container(
            color: bgColor,
            margin: EdgeInsets.only(bottom: 3),
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                color: Colors.white12,
                child: CachedNetworkImage(
                  imageUrl: imageLink,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                  height: 100,
                  width: 80,
              ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontSize: 18,
                      color: ColorPalette.textColor,
                ),
        ),
                    ),
        ),
        ]
      ),
          )
      );
}