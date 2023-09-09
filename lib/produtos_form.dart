import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_teste/componentes/navbar.dart';
import 'package:project_teste/models/produto_save.dart';
import 'package:project_teste/home.dart';
class FormProduto extends StatefulWidget {
  const FormProduto({Key? key}) : super(key: key);
  

  @override
  State<FormProduto> createState() => _FormProduto();
}

class _FormProduto extends State<FormProduto> {
  final nome = TextEditingController();
  final valor = TextEditingController();
  final quantidade =  TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formData = {
    'id': 145,
    'nome': '',
    'valor': 0,
    'quantidade': 0
  };
  Future<void> submit() async{
final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();
   
     await Provider.of<ProtudoSave>(
        context,
        listen: false,
      ).addProduct(nome.text, valor.text, quantidade.text);
      await Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['name']?.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Nome'
                      ),
                      keyboardType: TextInputType.text,
                      controller: nome,
                      validator: (_name) {
                        final name = _name ?? '';
                        if (name.trim().isEmpty) {
                          return 'Nome é obrigatório.';
                        }
                        if (name.trim().length < 3) {
                          return 'Nome precisa no mínimo de 3 letras.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText:  'Valor'
                      ),
                      keyboardType: TextInputType.number,
                      controller: valor,
                      onSaved: (newValue) => _formData['valor'] = newValue ?? 0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Quantidade'
                      ),
                      keyboardType: TextInputType.number,
                      controller: quantidade,
                      onSaved: (newValue) => _formData['quantidade'] = newValue ?? 0,
                    ),
                    ElevatedButton(
                        onPressed: submit,
                         child: const Text('Entra',
                         style: const TextStyle(
                            fontSize: 20
                         ),
                         ),
                         style: ButtonStyle(
                          
                         
                         ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
         appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //Navigator.of(context).pushNamed(NavBar.productForm);
            },
          )
        ],
      ),
        drawer: const NavBar(),
      ),
    );
  }
}