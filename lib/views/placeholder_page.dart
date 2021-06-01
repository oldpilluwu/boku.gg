import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/widgets/anime_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_downward_sharp),
          onTap: () {
            animeController.fetchPopularAnimeList();
          },
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (animeController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
            return GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              children: animeController.popularAnimeDisplayList
                  .map((AnimeDisplay anime) {
                return AnimeThumbnail(
                    imageLink: anime.image,
                    id: anime.id,
                    title: anime.title,
                    onPressed: () {});
              }).toList(),
            );
        }),
      ),
    );
  }
}
