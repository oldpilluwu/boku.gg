import 'package:boku_gg/commons/controller.dart';
import 'package:boku_gg/views/authentication/login_page.dart';
import 'package:boku_gg/views/home/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.user != null) {
        libraryController.getUserLibrary(authController.user!.uid);
      }
      return (authController.user != null) ? TabBarHomePage() : LoginPage();
    });

    // body: AnimePage(
    //   id: "naruto",
    //   title: "Naruto",
    //   imageLink: "https://gogocdn.net/images/anime/N/naruto.jpg",
    //   summary:
    //       "In a world of mystical and powerful enemies lurk in every nation, a legendary Nine-Tailed Demon Fox attacked the ninja village Konoha, killing many innocent people. In response of a desperate measure from the people, the leader of the village – the Fourth Hokage – sacrificed his life to defeat the demon fox. By sacrificing his own life, he sealed the demon fox into a very young boy named, Naruto Uzumaki. Naruto has lost his parents during the attack. He grew up in the village and was mistreated badly by everyone in town. With his loud mouth and careless attitude, he is determined to become the greatest ninja, hokage, in his village. Along with friends, and hope, Naruto trains to become a better ninja than expected.",
    //   genreList: [
    //     "Action",
    //     "Comedy",
    //     "Martial Arts",
    //     "Shounen",
    //     "Super Power"
    //   ],
    //   status: "Completed",
    //   totalEpisodes: 220,
    // ),
  }
}
