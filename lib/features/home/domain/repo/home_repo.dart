
import '../../../../../core/api/classes/dio_response.dart';

abstract class HomeRepo {
  Future<ApiResponse> getData();
}