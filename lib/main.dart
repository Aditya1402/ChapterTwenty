import 'package:flutter/material.dart';
import 'package:seventh_word/domain/route_generator.dart';
import 'package:seventh_word/pages/search/search.dart';
import 'pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seventh Word',
      home: HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
