import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/views/home/widgets/anime_thumbnail.dart';
import 'package:boku_gg/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeGridView extends StatelessWidget {
  final animeDisplayType;

  AnimeGridView({this.animeDisplayType});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        padding: const EdgeInsets.all(8),
        controller: animeDisplayType.value.scrollController,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: animeDisplayType.value.animeDisplayList
            .map<Widget>((AnimeDisplay anime) {
          return AnimeThumbnail(
              imageLink: anime.image,
              id: anime.id,
              title: anime.title,
              onPressed: () {
                animeController.fetchSingleAnimeDetails(anime.id);
                Get.to(() => LoadingScreen());
              });
        }).toList(),
      ),
    );
  }
}
