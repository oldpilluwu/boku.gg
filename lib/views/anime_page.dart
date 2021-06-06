import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/widgets/episode_button.dart';
import 'package:boku_gg/widgets/episode_quality_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AnimePage extends StatelessWidget {
  AnimePage({
    required this.imageLink,
    required this.id,
    required this.title,
    required this.status,
    required this.genreList,
    required this.totalEpisodes,
    this.summary = "",
  });
  final String imageLink;
  final String id;
  final String title;
  final String status;
  final List genreList;
  final int totalEpisodes;
  final String summary;
  final Color textColor = Color(0xFFDEDEDE);
  final Color statusBarColor = Colors.greenAccent;
  final Color statusTextColor = Color(0xFF282828);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF282828),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.white12,
                      child: CachedNetworkImage(
                        imageUrl: imageLink,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      height: 200,
                      width: 160,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Text(
                          "Description: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        summary,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 25,
                        color: statusBarColor,
                        child: Text(
                          "Status: " + status,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            color: statusTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Total Episodes: " + totalEpisodes.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        padding: const EdgeInsets.all(2),
                        controller: controller,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 2,
                        addAutomaticKeepAlives: true,
                        children: [
                          ...List.generate(
                              totalEpisodes,
                              (index) => EpisodeButton(
                                    onPressed: () {
                                      animeController.fetchAnimeEpisode(
                                          animeController.activeAnime!.value.id,
                                          index + 1);
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Obx(() {
                                              if (animeController
                                                  .episodeLoading.value)
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              else
                                                return ListView(
                                                  children: <Widget>[
                                                    ...animeController
                                                        .episodeQuality!
                                                        .map((element) =>
                                                            EpisodeQuality(
                                                                quality: element
                                                                    .quality,
                                                                link: element
                                                                    .link,
                                                                onPressed:
                                                                    () {})),
                                                  ],
                                                );
                                            });
                                          });
                                    },
                                    episodeNumber: index + 1,
                                  )),
                        ],
                      )
                    ],
                  ),
                ),
                // Expanded(
                //   child: ,
                // ),
              ]),
        ),
      ),
    );
  }
}
