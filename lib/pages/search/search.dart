import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:seventh_word/domain/services/api.dart';
import 'package:seventh_word/pages/search/widgets/searchWidget.dart';

import '../../config/colors.dart';
import '../../domain/custom_widgets/loadingIndicator.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  var _bookList;

  @override
  void initState() {
    // TODO: implement initState
    _bookList = ApiService.fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchBook());
              },
              icon: Icon(
                CupertinoIcons.search,
                size: 20,
              ))
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Palette.pebbleBlack),
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          'lib/config/images/AppBarLogo.svg',
          width: 50,
        ),
        shape:
            Border(bottom: BorderSide(color: Palette.cloudGray, width: 0.75)),
      ),
    );
  }
}
