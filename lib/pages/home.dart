import 'package:blog_flutter/config.dart';
import 'package:blog_flutter/services/article_service.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  List _articles = <dynamic>[];
  int _start = 0, _limit = 10, _total = 0;

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  void _getArticles() async {
    var response = await ArticleService.getArticles(_start, _limit);
    print(response);
    setState(() {
      _articles.addAll(response.data['data']);
      _total = response.data['total'];
    });
  }

  void _handleAdd() async {
    await Navigator.of(context).pushNamed('/add');
    _handlePullDownRefresh();
  }

  Future _handlePullDownRefresh() {
    return Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        _start = 0;
        _articles = [];
        _getArticles();
      });
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
      body: RefreshIndicator(
        onRefresh: _handlePullDownRefresh,
        child: ListView.separated(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            final backgroundColor = index % 2 == 0 ? lightGreen : lightGrey;

            if (_articles.length == 0 || index == _articles.length - 1) {
              if (_articles.length < _total - 1) {
                _start += _limit;
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
                title: Text(_articles[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22, height: 1.5, color: Colors.green)),
                subtitle: Text(
                  _articles[index]['content'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed('/article', arguments: _articles[index]),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _handleAdd,
      ),
    );
  }
}
