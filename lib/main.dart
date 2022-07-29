import 'package:flutter/material.dart';
import 'package:seventh_word/config/custom_theme.dart';
import 'package:seventh_word/domain/route_generator.dart';
import 'package:seventh_word/pages/home/home.dart';
import 'package:seventh_word/pages/home/widgets/cards.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seventh Word',
      theme: CustomWidgetTheme.lightTheme,
      home: HomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

