import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/api/useCases/params_use_case.dart';
import '../../data/model/book_model.dart';
import '../repo/travel_details_repo.dart';

class BookTripUseCase extends ParamUseCase<ApiResponse, BookModel> {
  final TravelDetailsRepo _repo;
  BookTripUseCase(this._repo);

  @override
  Future<ApiResponse> execute(BookModel req) {
    return _repo.book(model: req);
  }
}
