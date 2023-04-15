import 'package:flutter/material.dart';
import '../../../App/auth_service.dart';
import '../../../Presentation/DependencyInjection/getit.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({Key? key}) : super(key: key);
 
 @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
      onPressed: () => getIt<AuthService>().login(),
      child: const Text('Entrar no App'),
    )));
  }
}
