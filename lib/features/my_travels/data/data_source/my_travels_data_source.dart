


import 'package:dio/dio.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import 'package:travel_wise/core/services/app_services.dart';
import '../../../../../core/api/classes/api_request.dart';
import '../../../../../core/api/classes/dio_method.dart';
import '../../../../../core/api/links/api_links.dart';
import '../../../../../core/api/provider/api_provider.dart';

enum MyTravelsRequestType { getMyTravelsData }

class MyTravelsDataSource implements APIRequest {
  final MyTravelsRequestType type;
  MyTravelsDataSource._({
    required this.type,
  });

  MyTravelsDataSource.getMyTravelsData()
      : this._(type: MyTravelsRequestType.getMyTravelsData, );

  @override
  String get url {
    switch (type) {
      case MyTravelsRequestType.getMyTravelsData:
        return ApiLinks().getMyTravelsDataLink;
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
    return {
      'user_id':AppServices.localUserData?.id.toString()??''
    };
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
