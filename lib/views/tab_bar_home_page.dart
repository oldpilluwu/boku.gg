import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/widgets/anime_display_view.dart';
import 'package:boku_gg/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class TabBarHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NagivationBar(index: 0),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Center(
                child: Text(
                  "boku.gg",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorPalette.textColor),
                ),
              ),
              backgroundColor: ColorPalette.primaryColor,
              bottom: TabBar(
                labelColor: ColorPalette.primaryColor,
                unselectedLabelColor: ColorPalette.textColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: ColorPalette.secondaryColor,
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Popular"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Recent"),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  color: ColorPalette.secondaryColor,
                  child: AnimeDisplayPage(
                    animeTypeController: animeController.popularAnime,
                  ),
                ),
                Container(
                  color: ColorPalette.secondaryColor,
                  child: AnimeDisplayPage(
                    animeTypeController: animeController.recentAnime,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
