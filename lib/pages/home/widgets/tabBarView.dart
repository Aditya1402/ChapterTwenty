import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:seventh_word/pages/home/widgets/cards.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: 
        [
          Cards("Cooking, Food & Wine", "Ebooks to add to the shelf"),
          Cards("Religion & Spirituality", "The essential reading list"),
          Cards("Sci-Fi & Fantasy", ""),
          Cards("Health, Mind & Body", ""),
          Cards("Fiction & Literature", ""),
        ],
      ),
    );
  }
}
