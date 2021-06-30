import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/commons/font_resource.dart';
import 'package:boku_gg/views/anime_details/widgets/add_to_list_button.dart';
import 'package:boku_gg/views/anime_details/widgets/episode_list_gridview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  bool hasFinished(String status) {
    if(status == "Completed") return true;
    else return false;
  }

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
                Stack(
                  children: [
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
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
                              fontFamily: FontResource.secondaryFont,
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
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorPalette.secondaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              );
                            }).toList()),
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
                              fontWeight: FontWeight.w500,
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
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 16,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(2, 8, 2, 8),
                                decoration: BoxDecoration(
                                  color: hasFinished(status)
                                      ? ColorPalette.green
                                      : ColorPalette.orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Status: " + status,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontResource.secondaryFont,
                                    fontSize: 18,
                                    color: statusTextColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 4, child: Container()),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Obx(
                                  () => FloatingActionButton(
                                    heroTag: "add",
                                    child: Icon(
                                        !libraryController
                                            .isNotBookmarked(id)
                                            ? Icons.bookmark_added
                                            : Icons.bookmark_add,
                                      color: !libraryController
                                          .isNotBookmarked(id)
                                          ? ColorPalette.secondaryColorDark
                                          : ColorPalette.textColor,
                                    ),
                                    backgroundColor: !libraryController
                                        .isNotBookmarked(id)
                                        ? ColorPalette.secondaryColor
                                        : ColorPalette.secondaryColorDark.withOpacity(.75),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Obx(
                                            () => Column(
                                              children: [
                                                AddToListButton(
                                                  title: 'Currently Watching',
                                                  color: !libraryController
                                                          .isNotPresentIn(
                                                              'current', id)
                                                      ? ColorPalette.green
                                                      : ColorPalette
                                                          .secondaryColor,
                                                  onPressed: () async {
                                                    if (!libraryController
                                                        .isNotPresentIn(
                                                            'current', id))
                                                      return;
                                                    await libraryController
                                                        .removeFromAllList(
                                                            authController
                                                                .user!.uid,
                                                            id);
                                                    await libraryController
                                                        .addToList(
                                                            authController
                                                                .user!.uid,
                                                            'current',
                                                            id,
                                                            title,
                                                            imageLink);
                                                  },
                                                ),
                                                AddToListButton(
                                                  title: "Completed",
                                                  color: !libraryController
                                                          .isNotPresentIn(
                                                              'completed', id)
                                                      ? ColorPalette.green
                                                      : ColorPalette
                                                          .secondaryColor,
                                                  onPressed: () async {
                                                    if (!libraryController
                                                        .isNotPresentIn(
                                                            'completed', id))
                                                      return;
                                                    await libraryController
                                                        .removeFromAllList(
                                                            authController
                                                                .user!.uid,
                                                            id);
                                                    await libraryController
                                                        .addToList(
                                                            authController
                                                                .user!.uid,
                                                            'completed',
                                                            id,
                                                            title,
                                                            imageLink);
                                                  },
                                                ),
                                                AddToListButton(
                                                  title: "Watchlist",
                                                  color: !libraryController
                                                          .isNotPresentIn(
                                                              'watchlist', id)
                                                      ? ColorPalette.green
                                                      : ColorPalette
                                                          .secondaryColor,
                                                  onPressed: () async {
                                                    if (!libraryController
                                                        .isNotPresentIn(
                                                            'watchlist', id))
                                                      return;
                                                    await libraryController
                                                        .removeFromAllList(
                                                            authController
                                                                .user!.uid,
                                                            id);
                                                    await libraryController
                                                        .addToList(
                                                            authController
                                                                .user!.uid,
                                                            'watchlist',
                                                            id,
                                                            title,
                                                            imageLink);
                                                  },
                                                ),
                                                AddToListButton(
                                                    title: "Remove from list",
                                                    color: ColorPalette.red,
                                                    onPressed: () async {
                                                      await libraryController
                                                          .removeFromAllList(
                                                              authController
                                                                  .user!.uid,
                                                              id);
                                                    }),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 1, child: Container()),
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
                      EpisodeListGridview(
                        totalEpisodes: totalEpisodes,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
