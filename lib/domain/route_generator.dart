import 'package:flutter/material.dart';
import 'package:seventh_word/pages/home/home.dart';
import 'package:seventh_word/pages/search/search.dart';
import '../pages/details/details.dart';

class RouteGenerator {
  // Using a function - Most efficient way of routing
  // Allows the use of constructors
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Cases for the routings
    switch (settings.name) {
      // Case where you receive the page in which you declared routes (HomePage)
      case '/':
        return MaterialPageRoute(builder: ((context) => HomePage()));
      case '/searchPage':
        return MaterialPageRoute(builder: ((context) => SearchPage()));
      case '/detailPage':
        return MaterialPageRoute(builder: ((context) => DetailPage()));
      default:
        // If there is no such mentioned route in the context
        return MaterialPageRoute(builder: ((context) => SearchPage()));
    }
  }
}
