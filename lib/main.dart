import 'package:flutter/material.dart';
import 'package:seventh_word/app.dart';
import 'package:seventh_word/config/custom_theme.dart';
import 'package:seventh_word/domain/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seventh Word',
      theme: CustomWidgetTheme.lightTheme,
      home: MainPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

