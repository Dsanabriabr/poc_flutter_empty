
import '../Pages/Login/login_viewpage.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) {
            return LoginViewPage(context);
          })
    ]);