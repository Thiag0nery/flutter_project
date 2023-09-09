import 'package:flutter/material.dart';
import 'package:project_teste/models/produtos.dart';
import 'package:provider/provider.dart';
import 'package:project_teste/urls/app_rotas.dart';
import 'package:project_teste/login_register.dart';
import 'package:project_teste/auth_or_home_page.dart';
import 'package:project_teste/models/auth.dart';
import 'package:project_teste/models/produto_save.dart';
import 'package:project_teste/produtos_form.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rotas = GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
              path: '/',
              builder: (context, state) => AuthOrHomePage(),
            ),
            GoRoute(
              name: 'page2',
              path: '/form',
              builder: (context, state) => FormProduto(),
    ),
          ]
        
  
    );
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProtudoSave(),
        ),
        ChangeNotifierProvider(
          create: (_) => Produto(),
        )
      ],
    child:
    MaterialApp.router(
        routerConfig: _rotas

    )
    );
  }
}
