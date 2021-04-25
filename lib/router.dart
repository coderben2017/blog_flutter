import 'package:blog_flutter/pages/article.dart';
import 'package:blog_flutter/pages/form.dart';
import 'package:blog_flutter/pages/home.dart';
import 'package:flutter/cupertino.dart';

final Widget homeWidget = HomeWidget();

final Map<String, WidgetBuilder> routerMap = {
  '/home': (context) => HomeWidget(),
  '/article': (context) => ArticleWidget(),
  '/form': (context) => FormWidget()
};
