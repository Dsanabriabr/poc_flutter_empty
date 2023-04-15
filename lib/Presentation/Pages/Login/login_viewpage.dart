import 'package:flutter/material.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
      onPressed: () {  },
      child: const Text('Entrar no App'),
    )));
  }
}