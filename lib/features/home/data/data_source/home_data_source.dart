


import 'package:dio/dio.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import '../../../../../core/api/classes/api_request.dart';
import '../../../../../core/api/classes/dio_method.dart';
import '../../../../../core/api/links/api_links.dart';
import '../../../../../core/api/provider/api_provider.dart';

enum HomeRequestType { getHomeDta }

class HomeDataSource implements APIRequest {
  final HomeRequestType type;
  HomeDataSource._({
    required this.type,
  });

  HomeDataSource.getHomeDta()
      : this._(type: HomeRequestType.getHomeDta, );

  @override
  String get url {
    switch (type) {
      case HomeRequestType.getHomeDta:
        return ApiLinks().getHomeDataLink;
    }
  }

  @override
  DioMethod get method {
    return DioMethod.get;
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
