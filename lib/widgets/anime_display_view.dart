import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/widgets/anime_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDisplayPage extends StatelessWidget {
  final animeTypeController;

  AnimeDisplayPage({this.animeTypeController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: AnimeGridView(
              animeDisplayType: animeTypeController,
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
    );
  }
}
