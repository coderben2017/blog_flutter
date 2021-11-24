import 'package:blog_flutter/config.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    BaseOptions options = new BaseOptions(baseUrl: baseUrl);
    DioInterceptor dioInterceptor = new DioInterceptor();
    _http = Dio(options)..interceptors.add(dioInterceptor);
  }
}

class DioInterceptor extends InterceptorsWrapper {
  @override
  onResponse(response, handler) {
    if (response.data['code'] != 1) {
      Fluttertoast.showToast(msg: response.data['msg']);
      return null;
    }
    return handler.next(response);
  }

  @override
  onError(e, handler) {
    print(e.toString());
    return handler.next(e);
  }
}

final http = new Http().http;
