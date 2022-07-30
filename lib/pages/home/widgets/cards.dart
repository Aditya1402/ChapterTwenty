import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seventh_word/domain/custom_widgets/loadingIndicator.dart';
import 'package:seventh_word/domain/services/remote_service.dart';
import 'package:http/http.dart' as http;

class Cards extends StatefulWidget {
  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  // Pagination Components
  late ScrollController _controller;

  // To check if there exists a next page
  bool _hasNextPage = true;

  // To display Loading Indicator when fxn is running
  bool _firstLoadRunning = false;

  // To display Loading Indicator when fxn is running
  bool _loadMoreRunning = false;
  // We fetch the first 10 volumes
  int _page = 0;
  final int _limit = 10;
  final _baseUrl = "https://www.googleapis.com/books/v1/volumes?q=Flutter";

  var _bookList;

  // Called when the Application first launches
  void _firstLoad() async {
    setState(() {
      _firstLoadRunning = true;
    });

    try {
      final response =
          await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

      setState(() {
        _bookList = jsonDecode(response.body)["items"];
      });
    } catch (e) {
      if (kDebugMode) print("Something went wrong");
    }

    setState(() {
      _firstLoadRunning = false;
    });
  }

  // Called when the User reaches the end of the scroll list
  void _loadMore() async {
    if (_hasNextPage == true &&
        _firstLoadRunning == false &&
        _loadMoreRunning == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      setState(() {
        _loadMoreRunning = true;
      });

      _page += 1;

      try {
        final response =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = jsonDecode(response.body)["items"];

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _bookList.addAll(fetchedPosts);
          });
        } else
        // There is no more data
        {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        if (kDebugMode) print("Something went wrong");
      }

      setState(() {
        _loadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _firstLoadRunning
            ? Center(child: LoadingIndicator())
            : Column(children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _bookList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: Row(
                        children: 
                        [
                          SizedBox(
                            width: 100, height: 150,
                            child: Image.network(_bookList[index]['volumeInfo']['imageLinks']['thumbnail'])),
                            SizedBox(width: 30),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_bookList[index]['volumeInfo']['title'].toString(), style:TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              )),
                              Text(_bookList[index]['volumeInfo']['subtitle'].toString(), style:Theme.of(context).textTheme.subtitle2,),
                              Text(_bookList[index]['volumeInfo']['publisher'].toString()),
                              Text(_bookList[index]['volumeInfo']['pageCount'].toString() + " ★"),
                            ],
                          ))
                        ],
                      )
                    ),
                  ),
                ),
                if (_loadMoreRunning == true) LoadingIndicator(),
                if (_hasNextPage == false) Text("You have fetched all content!")
              ]));
  }
}
