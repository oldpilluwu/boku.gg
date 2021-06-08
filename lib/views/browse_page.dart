import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/commons/genre_list.dart';
import 'package:boku_gg/views/search_result.dart';
import 'package:boku_gg/widgets/genre_button.dart';
import 'package:boku_gg/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowsePage extends StatelessWidget {
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
                "Search by Genre",
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.w400,
                  color: ColorPalette.textColor,
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                controller: ScrollController(),
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: listOfGenreAndColor.map((e) {
                  return GenreButton(
                      title: e.text,
                      color: e.color,
                      onPressed: () {
                        searchController
                            .fetchGenreDisplayList(e.returnGenreId());
                        Get.to(() => SearchResultPage(
                              animeList: searchController.searchAnimeList,
                              controller: searchController.scrollController,
                            ));
                      });
                }).toList(),
                // ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
