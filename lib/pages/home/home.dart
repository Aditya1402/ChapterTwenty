import 'package:flutter/material.dart';
import 'package:seventh_word/domain/custom_widgets/appBar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Home Page"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/searchPage');
                },
                child: Text("Go to Search Page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/detailPage');
                },
                child: Text("Go to Detail Page")),
          ],
        ),
      ),
    );
  }
}
