import 'package:blog_flutter/widgets/article.dart';
import 'package:blog_flutter/widgets/home.dart';
import 'package:flutter/material.dart';
import './widgets/home.dart';
import 'config.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        routes: {
          '/home': (context) => HomeWidget(),
          '/article': (context) => ArticleWidget()
        },
        home: HomeWidget());
  }
}
