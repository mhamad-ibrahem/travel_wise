import 'package:dio/dio.dart';

import 'dio_method.dart';

extension HTTPMethodString on DioMethod {
  String get string {
    switch (this) {
      case DioMethod.get:
        return "get";
      case DioMethod.post:
        return "post";
      case DioMethod.delete:
        return "delete";
      case DioMethod.patch:
        return "patch";
      case DioMethod.put:
        return "put";
      case DioMethod.multiPart:
        return 'multipart';
      case DioMethod.download:
        return 'download';
    }
  }
}

abstract class APIRequest {
  String get url;
  DioMethod get method;
  bool get isAuthorized;
  Map<String, String>? get query;
  dynamic get body;
  CancelToken? cancelToken;
  Future request();
}
