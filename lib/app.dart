// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_word/config/colors.dart';

import 'pages/home/home.dart';
import 'pages/search/search.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [HomePage(), SearchPage()];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(top: BorderSide(color: Palette.cloudGray, width: 0.75))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Palette.shadowGray,
          selectedItemColor: Palette.pebbleBlack,
          currentIndex: _index,
          onTap: (index) => setState(() {
                  this._index = index;
                }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: 
        [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: ""),
        ]),
      ),

    body: screens[_index],
    );
  }
}
// NavigationBarTheme(
//       data: NavigationBarThemeData(
//         indicatorColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         labelTextStyle:
//             MaterialStateProperty.all(Theme.of(context).textTheme.caption),
//         height: 40,
//       ),
//       child: NavigationBar(
//           onDestinationSelected: (index) => setState(() {
//                 this._index = index;
//               }),
//           selectedIndex: 0,
//           destinations: [
//             const NavigationDestination(icon: Icon(FontAwesomeIcons.compass), label: "Home"),
//             const NavigationDestination(icon: Icon(FontAwesomeIcons.magnifyingGlass), label: "Search"),
//           ]),
//     ),