import 'package:flutter/material.dart';
import 'package:seventh_word/domain/custom_widgets/appBar.dart';
import 'package:seventh_word/domain/services/remote_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Calling fetchBooks() in initState() because we want it to process
  // when application first starts
  // var result;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   result = RemoteService().fetchBooks("Fitness");
  // }

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
