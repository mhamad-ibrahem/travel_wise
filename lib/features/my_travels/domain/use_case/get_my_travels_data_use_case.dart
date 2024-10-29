import 'package:dio/dio.dart';

import '../../../../../core/api/classes/dio_response.dart';
import '../../../../core/api/useCases/params_use_case.dart';
import '../repo/my_travels_repo.dart';

class GetMyTravelsDataUseCase extends ParamUseCase<ApiResponse, CancelToken> {
  final MyTravelsRepo _repo;
  GetMyTravelsDataUseCase(this._repo);

  @override
  Future<ApiResponse> execute(CancelToken cancelToken) {
    return _repo.getData(cancelToken);
  }
}
