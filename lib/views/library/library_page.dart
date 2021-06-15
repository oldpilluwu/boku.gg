import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/widgets/listed_anime.dart';
import 'package:boku_gg/widgets/logout_icon.dart';
import 'package:boku_gg/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NagivationBar(index: 2),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                LogoutIconButton(),
              ],
              // automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                  "boku.gg",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorPalette.textColor),
                // ),
              ),
              backgroundColor: ColorPalette.primaryColor,
              bottom: TabBar(
                labelColor: ColorPalette.primaryColor,
                unselectedLabelColor: ColorPalette.textColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: ColorPalette.secondaryColor,
                ),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Watching"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Wishlist"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Completed"),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  color: ColorPalette.primaryColor,
                  child: ListView.builder(
                    // Need to fetch user's lists from Firebase

                    controller: ScrollController(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ListedAnime(
                          title: "Anime",
                          id: "anime",
                          imageLink: "",
                          onPressed: () {
                            print("oogabooga");
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: ColorPalette.secondaryColor,
                ),
                Container(
                  color: ColorPalette.secondaryColor,
                ),
              ],
            )),
      ),
    );
  }
}