import '../../App/auth_service.dart';
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
      getIt.get<HomeViewModel>()));
  getIt.registerFactory<HomeViewPage>(
      () => HomeViewPage(viewModel: getIt.get<HomeViewPageModel>()));
}