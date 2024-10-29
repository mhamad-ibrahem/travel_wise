
import '../../../../../core/api/classes/dio_response.dart';

abstract class MainRepo {
  Future<ApiResponse> getData();
}