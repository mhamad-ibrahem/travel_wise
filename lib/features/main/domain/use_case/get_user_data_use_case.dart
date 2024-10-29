import 'package:travel_wise/core/api/useCases/no_params_use_case.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../repo/main_repo.dart';

class GetUserDataUseCase extends NoParamUseCase<ApiResponse> {
  final MainRepo _repo;
  GetUserDataUseCase(this._repo);

  @override
  Future<ApiResponse> execute() {
    return _repo.getData();
  }
}
