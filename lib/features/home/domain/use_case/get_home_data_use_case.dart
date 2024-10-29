import 'package:travel_wise/core/api/useCases/no_params_use_case.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../repo/home_repo.dart';

class GetHomeDataUseCase extends NoParamUseCase<ApiResponse> {
  final HomeRepo _repo;
  GetHomeDataUseCase(this._repo);

  @override
  Future<ApiResponse> execute() {
    return _repo.getData();
  }
}
