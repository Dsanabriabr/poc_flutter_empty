import 'package:poc_flutter_empty/Domain/Interfaces/UseCases/get_story_usecase_interface.dart';

import '../../App/auth_service.dart';
import '../../Data/Providers/network_provider.dart';
import '../../Data/Repositories/network_repository.dart';
import '../../Domain/Interfaces/Repositories/network_repository_interface.dart';
import '../../Domain/UseCases/get_story_usecase.dart';
import '../../Presentation/Pages/Home/home_viewpage.dart';
import '../../Presentation/Pages/Home/home_viewpagemodel.dart';
import '../../Presentation/Pages/Login/login_viewpage.dart';
import '../../Presentation/Views/Home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerFactory<LoginViewPage>(() => const LoginViewPage());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  getIt.registerFactory<HomeViewPageModel>(() => HomeViewPageModel(
      getIt.get<HomeViewModel>(), getIt.get<GetStoryUseCaseInterface>()));
  getIt.registerFactory<HomeViewPage>(
      () => HomeViewPage(viewModel: getIt.get<HomeViewPageModel>()));

  getIt.registerFactory<NetworkProvider>(() => NetworkProvider());
  getIt.registerFactory<NetworkRepositoryInterface>(() => NetworkRepository(getIt.get<NetworkProvider>()));
  getIt.registerFactory<GetStoryUseCaseInterface>(() => GetStoryUseCase(getIt.get<NetworkRepositoryInterface>()));

}