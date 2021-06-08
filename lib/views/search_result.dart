import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/genre_list.dart';
import 'package:boku_gg/widgets/genre_button.dart';
import 'package:boku_gg/widgets/listed_anime.dart';
import 'package:boku_gg/widgets/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {

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
              child: Text("Search Results",
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.w400,
                  color: ColorPalette.textColor,
                ),
              )
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [

                  //Use your search results here

                  ListedAnime(
                      title: "That Time I got reincarnated as a slime",
                      id: "naruto",
                      imageLink: "https://gogocdn.net/images/anime/N/naruto.jpg",
                      onPressed: () {}),

                  ListedAnime(
                      title: "Naruto",
                      id: "naruto",
                      imageLink: "https://gogocdn.net/images/anime/N/naruto.jpg",
                      onPressed: () {}),

                  ListedAnime(
                      title: "Naruto",
                      id: "naruto",
                      imageLink: "https://gogocdn.net/images/anime/N/naruto.jpg",
                      onPressed: () {print("eeeeeeeee");}),

                ],
              )
            ),
          ),
        ],
      ),
    );
  }

}