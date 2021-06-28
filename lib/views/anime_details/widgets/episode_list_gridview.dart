import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/anime_details/widgets/episode_button.dart';
import 'package:boku_gg/views/anime_details/widgets/episode_quality_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EpisodeListGridview extends StatelessWidget {

  EpisodeListGridview({
    required this.totalEpisodes,
});
  final int totalEpisodes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      padding: const EdgeInsets.all(2),
      controller: ScrollController(),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      itemCount: totalEpisodes,
      itemBuilder: (BuildContext context, int index) {
        return EpisodeButton(
          onPressed: () {
            animeController.fetchAnimeEpisode(
                animeController.activeAnime!.value.id,
                index + 1);
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Episode ${index + 1}',
                            style: TextStyle(
                                fontSize: 24,
                                color: ColorPalette
                                    .textColor),
                          ),
                        ),
                      ),
                      Divider(),
                      Obx(() {
                        if (animeController
                            .episodeLoading.value)
                          return Center(
                            child:
                            CircularProgressIndicator(),
                          );
                        else
                          return Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                ...animeController
                                    .episodeQuality!
                                    .map(
                                      (element) =>
                                      EpisodeQuality(
                                        quality: element
                                            .quality,
                                        link:
                                        element.link,
                                      ),
                                ),
                              ],
                            ),
                          );
                      }),
                    ],
                  );
                });
          },
          episodeNumber: index + 1,
        );
      },

    );
  }
}
