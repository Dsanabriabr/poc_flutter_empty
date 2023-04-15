
import 'package:poc_flutter_empty/Presentation/Pages/Login/login_viewpagemodel.dart';

import '../Pages/Login/login_viewpage.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) {
            return LoginViewPage(context);
          })
    ]);