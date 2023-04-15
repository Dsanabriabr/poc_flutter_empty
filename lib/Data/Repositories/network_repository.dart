import '../../App/constants.dart';
import '../../Data/Providers/network_provider.dart';
import '../../Domain/DTOs/request_data.dart';
import '../../Domain/Interfaces/Repositories/network_repository_interface.dart';
import 'package:result_dart/result_dart.dart';

//typedef AsyncResult<S, F> = Future<Result<Object, Object>>;

class NetworkRepository implements NetworkRepositoryInterface {
  NetworkProvider provider;
  NetworkRepository(this.provider);

  @override
  AsyncResult<Object, Exception> getImageData(RequestData data) {
    return provider.request(HTTPMethods.post, endpoint, data.convertMap());
  }

  @override
  AsyncResult<Object, Exception> getStoryData(RequestData data) {
    return provider.request(HTTPMethods.post, endpoint, data.convertMap());
  }
}
