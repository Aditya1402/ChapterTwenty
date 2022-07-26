import 'package:flutter/material.dart';
import '../search/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>
          [
            Text("Home Page"),
            ElevatedButton(onPressed: ()
            {
              Navigator.of(context).pushNamed('/searchPage');
            }, child: Text("Go to Search Page")),

            ElevatedButton(onPressed: ()
            {
              Navigator.of(context).pushNamed('/detailPage');
            }, child: Text("Go to Detail Page"))
          ],
        ),
      ),
    );
  }
}
