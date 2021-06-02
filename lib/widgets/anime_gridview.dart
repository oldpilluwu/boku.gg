import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/views/anime_page.dart';
import 'package:boku_gg/widgets/anime_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeGridView extends StatelessWidget {
  final animeDisplayType;

  AnimeGridView({this.animeDisplayType});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        controller: animeDisplayType.value.scrollController,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
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
                Get.to(AnimePage(
                  imageLink: animeController.activeAnime!.value.image,
                  id: animeController.activeAnime!.value.id,
                  title: animeController.activeAnime!.value.title,
                  status: animeController.activeAnime!.value.status,
                  genreList: animeController.activeAnime!.value.genres,
                  totalEpisodes:
                      animeController.activeAnime!.value.totalEpisodes,
                ));
              });
        }).toList(),
      ),
    );
  }
}
