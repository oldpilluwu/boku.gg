import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (animeController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return SafeArea(
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              children: animeController.popularAnimeDisplayList
                  .map((AnimeDisplay anime) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Flexible(
                    child: Column(
                      children: [
                        Image.network(anime.image),
                        Text(
                          anime.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
      }),
    );
  }
}
