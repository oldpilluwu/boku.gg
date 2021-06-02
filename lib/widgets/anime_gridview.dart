import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/widgets/anime_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        controller: animeController.popularScrollController,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children:
            animeController.popularAnimeDisplayList.map((AnimeDisplay anime) {
          return AnimeThumbnail(
              imageLink: anime.image,
              id: anime.id,
              title: anime.title,
              onPressed: () {});
        }).toList(),
      ),
    );
  }
}
