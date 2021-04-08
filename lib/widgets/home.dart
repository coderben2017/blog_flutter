import 'package:blog_flutter/config.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  static const lightGreen = const MaterialColor(0xFFE8F5E9, <int, Color>{
    50: Color(0xFFE8F5E9),
    100: Color(0xFFC8E6C9),
    200: Color(0xFFA5D6A7),
    300: Color(0xFF81C784),
    400: Color(0xFF66BB6A),
    500: Color(0xFF4CAF50),
    600: Color(0xFF43A047),
    700: Color(0xFF388E3C),
    800: Color(0xFF2E7D32),
    900: Color(0xFF1B5E20),
  });
  static const lightGrey = const MaterialColor(0xf7f7f7, <int, Color>{
    50: Color(0xf7f7f7),
    100: Color(0xFFC8E6C9),
    200: Color(0xFFA5D6A7),
    300: Color(0xFF81C784),
    400: Color(0xFF66BB6A),
    500: Color(0xFF4CAF50),
    600: Color(0xFF43A047),
    700: Color(0xFF388E3C),
    800: Color(0xFF2E7D32),
    900: Color(0xFF1B5E20),
  });
  var _articles = <String>[];

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  void _onTapArticle(index) {
    print(_articles[index]);
  }

  void _getArticles() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _articles.addAll(generateWordPairs()
            .take(20)
            .map((wordPair) => wordPair.asPascalCase)
            .toList());
      });
      print(_articles);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            appConfig['title'],
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: ListView.separated(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            final backgroundColor = index % 2 == 0 ? lightGreen : lightGrey;

            if (_articles.length == 0 || index == _articles.length - 1) {
              if (_articles.length < 51) {
                _getArticles();
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: backgroundColor),
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: backgroundColor),
                  child: Text('没有更多了', style: TextStyle(color: Colors.black87)),
                );
              }
            }

            return Container(
              decoration: BoxDecoration(color: backgroundColor),
              child: ListTile(
                title: Text(_articles[index],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22, height: 1.5, color: Colors.green)),
                subtitle: Text(
                  _articles[index] * 15,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                onTap: () => _onTapArticle(index),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 0,
          ),
        ));
  }
}
