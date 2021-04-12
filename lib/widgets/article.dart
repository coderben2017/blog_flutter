import 'package:blog_flutter/config.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final article;

  ArticleWidget({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map params = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(params['title'])),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
        decoration: BoxDecoration(color: lightGreen),
        child: SingleChildScrollView(
            child: Text(
          '\t\t\t\t\t\t\t' + params['content'],
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'NotoSansSC',
              height: 1.6,
              letterSpacing: 1),
        )),
      ),
    );
  }
}
