import 'package:blog_flutter/router.dart';
import 'package:flutter/material.dart';
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
        routes: routerMap,
        home: homeWidget);
  }
}
