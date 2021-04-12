import 'package:blog_flutter/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Http {
  factory Http() => _getInstance();
  static Http _instance;

  Dio get http => _http;
  Dio _http;

  static _getInstance() {
    if (_instance == null) {
      _instance = Http._();
    }
    return _instance;
  }

  Http._() {
    BaseOptions options =
        new BaseOptions(baseUrl: baseUrl);
    InterceptorsWrapper interceptorsWrapper = new InterceptorsWrapper(
      onResponse: (res, handler) {
        // if (res.data.code != 0) {
        //   return handler.reject(DioError(requestOptions: res.requestOptions));
        // }
        return handler.next(res);
      },
      onError: (e, handler) {
        AlertDialog(
          title: Text('网络出错'),
          content: Text(e.toString()),
        );
        return handler.next(e);
      },
    );

    _http = Dio(options);
    _http.interceptors.add(interceptorsWrapper);
  }
}

final http = new Http().http;
