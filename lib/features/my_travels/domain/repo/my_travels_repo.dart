
import 'package:dio/dio.dart';

import '../../../../../core/api/classes/dio_response.dart';

abstract class MyTravelsRepo {
  Future<ApiResponse> getData(CancelToken cancelToken);
}