import 'package:boku_gg/commons/color_palette.dart';
import 'package:boku_gg/views/home/tab_bar_home_page.dart';
import 'package:boku_gg/views/library/library_page.dart';
import 'package:boku_gg/views/search/browse_page.dart';
import 'package:boku_gg/widgets/logout_icon.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  // Color bgColor = Colors.black26;
  List<Widget> _widgetOptions = <Widget> [
    TabBarHomePage(),
    BrowsePage(),
    LibraryPage(),
  ];

  void _onItemTap (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: ColorPalette.secondaryColor,
          selectedItemColor: ColorPalette.textColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: ColorPalette.secondaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Browse",
            backgroundColor: ColorPalette.secondaryColorDark,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Library",
            backgroundColor: ColorPalette.secondaryColorDark,
          ),
        ],
      currentIndex: _selectedIndex,
        onTap: _onItemTap,
      
      ),
      
    );
  }
}