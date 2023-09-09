import 'package:flutter/material.dart';
import 'package:project_teste/home.dart';
import 'package:provider/provider.dart';
import 'package:project_teste/models/auth.dart';
import 'package:project_teste/login_register.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? Homepage() : const LoginRegister();
  }
}
