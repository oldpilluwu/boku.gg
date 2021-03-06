import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/views/library/widgets/listed_anime.dart';
import 'package:boku_gg/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryListView extends StatelessWidget {
  LibraryListView({required this.list});

  final List<AnimeDisplay> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.primaryColor,
      child: Obx(() {
        return ListView.builder(
          controller: ScrollController(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListedAnime(
                title: list[index].title,
                id: list[index].id,
                imageLink: list[index].image,
                onPressed: () {
                  print(list[index].id);
                  animeController.fetchSingleAnimeDetails(list[index].id);
                  Get.to(() => LoadingScreen());
                },
              ),
            );
          },
        );
      }),
    );
  }
}
