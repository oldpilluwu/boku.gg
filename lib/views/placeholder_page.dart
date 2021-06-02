import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/anime_display_view.dart';
import 'package:flutter/material.dart';

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
      body: AnimeDisplayPage(),
    );
  }
}
