import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/video_player/video_player_page.dart';
import 'package:boku_gg/widgets/episode_button.dart';
import 'package:boku_gg/widgets/episode_quality_widget.dart';
import 'package:boku_gg/widgets/genre_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

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
  final Color statusBarColor = ColorPalette.green;
  final Color statusTextColor = Color(0xFF282828);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF282828),
          child: Column(

              // Positioned()

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Stack(
                  children: [
                        Container(
                          height: 35,
                          width: 35,
                          child: FloatingActionButton(
                            child: Icon(Icons.check),
                            onPressed: () {},
                            backgroundColor: Colors.pink,
                          ),
                        ),
                    // Positioned(
                    //   right: 8,
                    //   top: 12,
                    //   child: Container(
                    //     height: 35,
                    //     width: 35,
                    //     child: FloatingActionButton(
                    //         child: Icon(Icons.add),
                    //         onPressed: () {},
                    //         backgroundColor: Colors.pink,
                    //       ),
                    //   ),
                    // ),


                    Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
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
                      ),

                      Expanded(
                        flex: 6,
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
                    ],
                  ),


                  Expanded(
                    child: ListView(
                    shrinkWrap: true,
                    children: [

                    Container(
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 0),
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        shrinkWrap: true,
                        children: genreList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 5),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                              child: Text(e,
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorPalette.primaryColor,
                              ),),
                              decoration: BoxDecoration(
                                color: ColorPalette.secondaryColor,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),




                          );
                        }).toList()
                      ),
                    ),

                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 10),
                        child: Container(
                          child: Text(
                            "Description: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          summary,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                          ),
                        ),
                      ),

                      //
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 16,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(2, 8, 2, 8),
                                    decoration: BoxDecoration(
                                      color: statusBarColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                    "Status: " + status,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: statusTextColor,
                                    ),
                                  ),
                                // ),
                      ),
                              ),
                              Expanded(flex: 4,child: Container()),
                              Expanded(
                                flex: 4,
                                child: Container(
                                    child: FloatingActionButton(
                                      heroTag: "add",
                                      child: Icon(Icons.add, color: ColorPalette.textColor,),
                                      backgroundColor: ColorPalette.secondaryColorDark.withOpacity(.75),
                                      onPressed: () {
                                        //DO YOUR SHIT
                                      },
                                    ),
                                  ),
                                ),
                              Expanded(flex: 1,child: Container()),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: FloatingActionButton(
                                    heroTag: "check",
                                    child: Icon(Icons.check, color: ColorPalette.textColor,),
                                    backgroundColor: ColorPalette.secondaryColorDark.withOpacity(.75),
                                    onPressed: () {
                                      //DO YOUR SHIT
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Episodes: " + totalEpisodes.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                      ),

                      GridView.count(
                        padding: const EdgeInsets.all(2),
                        controller: animeDetailScrollContainer,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 2,
                        addAutomaticKeepAlives: false,
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
                                            return Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Center(
                                                    child: Text(
                                                      'Episode ${index + 1}',
                                                      style: TextStyle(
                                                          fontSize: 24),
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
                                  )),
                        ],
                      )
                    ],
                  ),
                ),
                //   child: ,
                // ),
              ]),
        ),
      ),
    );
  }
}
