
import '../../../../../core/api/classes/dio_response.dart';
import '../../data/model/register_model.dart';


abstract class RegisterRepo {
  Future<ApiResponse> register({required RegisterModel model});
}