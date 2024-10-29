


import 'package:dio/dio.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';

import '../../../../../core/api/classes/api_request.dart';
import '../../../../../core/api/classes/dio_method.dart';
import '../../../../../core/api/links/api_links.dart';
import '../../../../../core/api/provider/api_provider.dart';

enum LoginRequestType { login }

class LoginApi implements APIRequest {
  final LoginRequestType type;
  LoginApi._({
    required this.type,
    required this.body,
  });

  LoginApi.login(dynamic body)
      : this._(type: LoginRequestType.login, body: body);

  @override
  String get url {
    switch (type) {
      case LoginRequestType.login:
        return ApiLinks().loginLink;
    }
  }

  @override
  DioMethod get method {
    return DioMethod.post;
  }

  @override
  bool get isAuthorized => false;

  @override
  Map<String, String> get query {
    return {};
  }

  @override
  dynamic body;

  @override
  Future<ApiResponse> request() {
    return APIProvider.instance.request(this);
  }

  @override
  CancelToken? cancelToken;
}
