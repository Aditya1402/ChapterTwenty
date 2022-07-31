import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seventh_word/config/colors.dart';
import 'package:seventh_word/domain/custom_widgets/loadingIndicator.dart';
import 'package:http/http.dart' as http;
import 'package:seventh_word/domain/models/bookModel.dart';
import 'package:seventh_word/pages/details/details.dart';

final baseUri = Uri.parse("https://www.googleapis.com/books/v1/volumes");

class Cards extends StatefulWidget {
  String _genreType = " ";
  String info;
  Cards(this._genreType, this.info);
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
  late Uri _requestUri;

  var _bookList;

  // Called when the Application first launches
  void _firstLoad() async {
    setState(() {
      _firstLoadRunning = true;
    });

    try {
      final response =
          await http.get(Uri.parse("$_requestUri?_page=$_page&_limit=$_limit"));

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
        _controller.position.extentAfter < 100) {
      setState(() {
        _loadMoreRunning = true;
      });

      _page += 1;

      try {
        final response = await http
            .get(Uri.parse("$_requestUri?_page=$_page&_limit=$_limit"));

        final List fetchedPosts = jsonDecode(response.body)["items"];

        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _bookList.addAll(fetchedPosts) ?? null;
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
    _requestUri = baseUri.replace(
      queryParameters: {
        'q': widget._genreType,
      },
    );

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
    return _firstLoadRunning || _loadMoreRunning
        ? Center(child: LoadingIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${widget._genreType}",
                            style: Theme.of(context).textTheme.headline1),
                        Text(
                          "${widget.info}",
                          style: TextStyle(
                            color: Palette.shadowGray,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    Icon(CupertinoIcons.arrow_right)
                  ],
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 245,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  controller: _controller,
                  itemCount: _bookList.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width / 3.6,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DetailPage(
                                    _bookList[index]['volumeInfo']['authors'],
                                    _bookList[index]['volumeInfo']
                                        ['averageRating'],
                                    _bookList[index]['volumeInfo']
                                        ['description'],
                                    _bookList[index]['volumeInfo']['pageCount'],
                                    _bookList[index]['volumeInfo']
                                        ['previewLink'],
                                    _bookList[index]['volumeInfo']
                                        ['publishedDate'],
                                    _bookList[index]['volumeInfo']['publisher'],
                                    _bookList[index]['volumeInfo']['imageLinks']
                                        ['thumbnail'],
                                    _bookList[index]['volumeInfo']['title'],
                                    _bookList[index]['saleInfo']['isEbook'],
                                    _bookList[index]['accessInfo']['epub']
                                        ['acsTokenLink'],
                                    _bookList[index]['accessInfo']
                                        ['webReaderLink'],
                                  )))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    width: 0.75,
                                    style: BorderStyle.solid,
                                    color: Palette.cloudGray),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: _bookList[index]['volumeInfo']['imageLinks']!=null
                                        ? NetworkImage(_bookList[index]['volumeInfo']['imageLinks']['thumbnail'])
                                        : NetworkImage("https://cdn.bookauthority.org/dist/images/book-cover-not-available.6b5a104fa66be4eec4fd16aebd34fe04.png")
                                  
                               
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Text(
                            _bookList[index]['volumeInfo']['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                          Expanded(
                            child: Text(
                              _bookList[index]['saleInfo']['listPrice'] != null
                                  ? ("₹" +
                                      _bookList[index]['saleInfo']['listPrice']
                                              ['amount']
                                          .toString())
                                  : "",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Palette.anchorGray,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
    // if (_hasNextPage == false) Text("You have fetched all content!")
  }
}





// Card(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 150,
//                           child: Image.network(_bookList[index]['volumeInfo']
//                               ['imageLinks']['thumbnail'])),
//                       SizedBox(width: 30),
//                       Expanded(
//                           child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               _bookList[index]['volumeInfo']['title']
//                                   .toString(),
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w600)),
//                           Text(
//                             _bookList[index]['volumeInfo']['subtitle']
//                                 .toString(),
//                             style: Theme.of(context).textTheme.subtitle2,
//                           ),
//                           Text(_bookList[index]['volumeInfo']['publisher']
//                               .toString()),
//                           Text(_bookList[index]['volumeInfo']['pageCount']
//                                   .toString() +
//                               " ★"),
//                         ],
//                       ))
//                     ],
//                   )),
