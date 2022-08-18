import 'package:flutter/material.dart';
import 'package:myproject/pages/login/view/view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LoginView(),
    );
  }
}
