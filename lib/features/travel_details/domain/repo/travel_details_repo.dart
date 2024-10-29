
import '../../../../../core/api/classes/dio_response.dart';
import '../../data/model/book_model.dart';

abstract class TravelDetailsRepo {
  Future<ApiResponse> book({required BookModel model});
}