import 'package:boku_gg/views/search/browse_page.dart';
import 'package:boku_gg/views/library/library_page.dart';
import 'package:boku_gg/views/home/tab_bar_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NagivationBar extends BottomNavigationBar {
  NagivationBar({
    required int index,
    Color bgColor = Colors.black26,
    Color unselectedColor = Colors.grey,
    Color selectedColor = Colors.white,
  }) : super(
          onTap: (int index) {
            if (index == 0) {
              Get.offAll(() => TabBarHomePage());
            } else if (index == 1) {
              Get.offAll(() => BrowsePage());
            } else if (index == 2) {
              Get.offAll(() => LibraryPage());
            }
          },
          unselectedItemColor: unselectedColor,
          selectedItemColor: selectedColor,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: bgColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Browse",
              backgroundColor: bgColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "Library",
              backgroundColor: bgColor,
            ),
          ],
        );
}
