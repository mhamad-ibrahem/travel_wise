import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/api/useCases/params_use_case.dart';
import '../../data/model/login_model.dart';
import '../repo/login_repo.dart';

class LoginUseCase extends ParamUseCase<ApiResponse, LoginModel> {
  final LoginRepo _repo;
  LoginUseCase(this._repo);

  @override
  Future<ApiResponse> execute(LoginModel req) {
    return _repo.login(loginModel: req);
  }
}
