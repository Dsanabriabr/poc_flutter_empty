import '../../App/auth_service.dart';
import '../Pages/Home/home_viewpagemodel.dart';
import '../Pages/Login/login_viewpage.dart';
import '../Pages/Home/home_viewpage.dart';
import '../../Presentation/DependencyInjection/getit.dart';
import 'package:go_router/go_router.dart';

import '../Views/Home/home_viewmodel.dart';

final routes = GoRouter(
    initialLocation: '/',
    refreshListenable: getIt<AuthService>(),
    redirect: (context, state) {
      final isAuthenticated = getIt<AuthService>().isAuthenticated;
      final isLoginRoute = state.subloc == '/login';

      if (!isAuthenticated) {
        return isLoginRoute ? null : '/login';
      }

      if (isLoginRoute) return '/';
      return null;
    },
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) {
            return getIt.get<LoginViewPage>();
          }),
      GoRoute(
          path: '/',
          builder: (context, state) {
            return getIt.get<HomeViewPage>();
          }),
    ]);
