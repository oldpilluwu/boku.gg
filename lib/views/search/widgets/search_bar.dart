import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentText ="";
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: ColorPalette.primaryColor.withOpacity(.23),
            )
          ]),

      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (text) {
                currentText = text;
                print(text);
              },
              onSubmitted: (text) {
                searchController.fetchSearchDisplayList(text);
                Get.to(() => SearchResultPage(
                      animeList: searchController.searchAnimeList,
                      controller: searchController.scrollController,
                    ));
              },

              style: TextStyle(
                color: ColorPalette.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: ColorPalette.secondaryColor,
                ),
                // fillColor: Colors.red,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    searchController.fetchSearchDisplayList(currentText);
                    Get.to(() => SearchResultPage(
                      animeList: searchController.searchAnimeList,
                      controller: searchController.scrollController,
                    ));
                  },
                  child: Icon(
                    Icons.search_rounded,
                    color: ColorPalette.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // color: Colors.white,
    );
  }
}
