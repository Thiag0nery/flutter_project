import 'package:flutter/material.dart';
import 'package:project_teste/produtos_form.dart';
import 'package:project_teste/home.dart';
import '../urls/app_rotas.dart';
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: Column(
        children: [
          AppBar(
           
            automaticallyImplyLeading: false,
          ),
          const Divider(),
         ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Homepage'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text('Cadastro de produto'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => FormProduto()));
            },
          ),
        ],
      ),
    );
  }
}