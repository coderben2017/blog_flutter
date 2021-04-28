import 'package:blog_flutter/pages/article.dart';
import 'package:blog_flutter/pages/add.dart';
import 'package:blog_flutter/pages/home.dart';
import 'package:blog_flutter/pages/login.dart';
import 'package:flutter/cupertino.dart';

final Widget homeWidget = HomeWidget();

final Map<String, WidgetBuilder> routerMap = {
  '/login': (context) => LoginWidget(),
  '/home': (context) => HomeWidget(),
  '/article': (context) => ArticleWidget(),
  '/add': (context) => AddWidget()
};
