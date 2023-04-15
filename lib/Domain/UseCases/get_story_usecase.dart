import '../DTOs/request_data.dart';
import '../Interfaces/Repositories/network_repository_interface.dart';
import '../Interfaces/UseCases/get_story_usecase_interface.dart';
import 'package:result_dart/result_dart.dart';

class GetStoryUseCase implements GetStoryUseCaseInterface {
  NetworkRepositoryInterface repository;

  GetStoryUseCase(this.repository);
  
  @override
  AsyncResult<String, Exception> getImagenData(RequestData data)  async {
    final response = await repository.getImageData(data);
    response.fold((success) {
      return Success(response);
    }, (error) {
      return Failure(response);
    });
    return Failure(Exception('Error GetStoryUseCase getImagenData'));
  }
  
  @override
  AsyncResult<String, Exception> getStoryData(RequestData data)  async {
    final response = await repository.getStoryData(data);
    response.fold((success) {
      return Success(response);
    }, (error) {
      return Failure(response);
    });
    return Failure(Exception('Error GetStoryUseCase getStoryData'));
  }
}