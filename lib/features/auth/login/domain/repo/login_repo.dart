
import '../../../../../core/api/classes/dio_response.dart';
import '../../data/model/login_model.dart';

abstract class LoginRepo {
  Future<ApiResponse> login({required LoginModel loginModel});
}