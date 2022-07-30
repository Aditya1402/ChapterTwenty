// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
      bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.white,
        labelTextStyle:
            MaterialStateProperty.all(Theme.of(context).textTheme.caption),
        height: 40,
      ),
      child: NavigationBar(
          onDestinationSelected: (index) => setState(() {
                this._index = index;
              }),
          selectedIndex: 0,
          destinations: [
            const NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            const NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          ]),
    ),

    body: screens[_index],
    );
  }
}
