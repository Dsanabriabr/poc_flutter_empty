import 'package:poc_flutter_empty/Domain/DTOs/request_data.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetStoryUseCaseInterface {
  AsyncResult<String, Exception> getStoryData(RequestData data);
  AsyncResult<String, Exception> getImagenData(RequestData data);
}