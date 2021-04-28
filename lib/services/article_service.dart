import 'package:blog_flutter/services/http.dart';

abstract class ArticleService {
  static Future getArticles(int start, int limit) {
    return http
        .get('/articles', queryParameters: {'start': start, 'limit': limit});
  }

  static Future query(String id) {
    return http.get('/article', queryParameters: {'id': id});
  }

  static Future save(String title, String content, String author, [String id]) {
    String createTime = DateTime.now().toString().substring(0, 19);
    return http.post('/article', data: {
      'title': title,
      'content': content,
      'author': author,
      'id': id,
      'createTime': createTime
    });
  }
}
