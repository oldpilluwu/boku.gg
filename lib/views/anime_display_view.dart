import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/widgets/anime_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Text(
                "Popular Right Now",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: AnimeGridView(
                animeDisplayType: animeController.popularAnime.value,
              ),
            ),
            Obx(() {
              if (animeController.isLoading.value)
                return Center(child: LinearProgressIndicator());
              else
                return Container(
                  height: 0,
                );
            })
          ],
        ),
      ),
    );
  }
}
