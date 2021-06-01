
import 'package:blog_flutter/services/http.dart';

abstract class UserService {
  static Future login(String userName, String password) {
    return http.post('/login', data: {
      'userName': userName,
      'password': password
    });
  }
}