import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/controllers/search_controller.dart';
import 'package:boku_gg/models/anime_display_model.dart';

import 'package:boku_gg/widgets/listed_anime.dart';
import 'package:boku_gg/widgets/loading.dart';
import 'package:boku_gg/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchResultPage extends StatelessWidget {
  RxList<AnimeDisplay> animeList;
  ScrollController controller;

  SearchResultPage({
    required this.animeList,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      // padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(
                "Search Results",
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.w400,
                  color: ColorPalette.textColor,
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                return ListView.builder(
                  controller: controller,
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    return ListedAnime(
                      title: animeList[index].title,
                      id: animeList[index].id,
                      imageLink: animeList[index].image,
                      onPressed: () {
                        animeController
                            .fetchSingleAnimeDetails(animeList[index].id);
                        Get.to(() => LoadingScreen());
                      },
                    );
                  },
                );
              }),
            ),
          ),
          Obx(() {
            if (searchController.isLoading.value)
              return Center(child: LinearProgressIndicator());
            else
              return Container();
          })
        ],
      ),
    );
  }
}
