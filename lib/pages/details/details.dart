import 'package:flutter/material.dart';
import '../search/search.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>
          [
            Text("Detail Page"),
            ElevatedButton(onPressed: ()
            {
              Navigator.of(context).pop();
            }, child: Text("Go to Home Page"))
          ],
        ),
      ),
    );
  }
}