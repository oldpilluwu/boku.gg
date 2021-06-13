import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/anime_details/anime_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (animeController.isLoading.value)
        return Expanded(
          child: Container(
            color: Colors.grey.shade900,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      else {
        return AnimePage(
          imageLink: animeController.activeAnime!.value.image,
          id: animeController.activeAnime!.value.id,
          title: animeController.activeAnime!.value.title,
          status: animeController.activeAnime!.value.status,
          genreList: animeController.activeAnime!.value.genres,
          totalEpisodes: animeController.activeAnime!.value.totalEpisodes,
          summary: animeController.activeAnime!.value.summary,
        );
      }
    });
  }
}
