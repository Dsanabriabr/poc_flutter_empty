import 'package:result_dart/result_dart.dart';
import '../../DTOs/request_data.dart';

abstract class NetworkRepositoryInterface {
  AsyncResult<Object, Exception> getStoryData(RequestData data);
  AsyncResult<Object, Exception> getImageData(RequestData data);
}