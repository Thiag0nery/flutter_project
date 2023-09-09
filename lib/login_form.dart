import 'package:flutter/material.dart';
import 'package:project_teste/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:project_teste/errors/auth_error.dart';
enum UsuarioEscolha {SingUp, Login}
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginForm> {
  UsuarioEscolha escolha = UsuarioEscolha.Login;
  final _formKey = GlobalKey<FormState>();
  final _passwordForm = TextEditingController();
  final Map<String, String> UsuarioRegistro = {
    'email':'',
    'password':''
  };
  bool login() => escolha == UsuarioEscolha.Login;
  bool loginProgresso = false;
  bool registro() => escolha == UsuarioEscolha.SingUp;

void _showErrorDialog(String msg) {
    Text('asdasdasdasd');
  }

  void troca(){
    setState(() {
      if(login()){
        escolha = UsuarioEscolha.SingUp;
      }
      else{
        escolha = UsuarioEscolha.Login;
      }
    });
  }
  Future<void> submit() async{
    final validadeForm = _formKey.currentState?.validate() ?? false;
      if(!validadeForm){
        return ;
      }
      _formKey.currentState?.save();
       Auth auth = Provider.of(context, listen: false);
       //coloca o cirulo de progresso
       
    setState(() => loginProgresso = true);
    
    try{
    if(login()){
        await auth.signin(UsuarioRegistro['email']!, UsuarioRegistro['password']!);
    }
    else{
     
      await auth.signup(UsuarioRegistro['email']!, UsuarioRegistro['password']!);
    }
    }
     on AuthException catch (error) {
      print(error);
      _showErrorDialog(error.toString());
    } catch (error) {
      print(error);
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    
    //Retira o cirulo de progresso
    setState(() => loginProgresso = false);
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
                child: Column(              
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              

                children: [
                  
                  Column(
                    children: [
                      const Text(
                    'Login',
                    style:  TextStyle(
                        fontSize:40
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => UsuarioRegistro['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail válido.';
                  }
                  return null;
                },
                  ),
                  const SizedBox(height:20),
                    TextFormField(

                      keyboardType: TextInputType.visiblePassword,
                       controller: _passwordForm,
                        onSaved: (password) => UsuarioRegistro['password'] = password ?? '',
                        validator: (_password) {
                          final password = _password ?? '';
                          if (password.isEmpty || password.length < 5) {
                            return 'Informe uma senha válida';
                          }
                          return null;
                        },
                    decoration: const InputDecoration(
                      
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        fontSize: 20
                      )
                    ),
                  ),
                  if(escolha == UsuarioEscolha.SingUp)
                    
                  TextFormField(
                    validator: UsuarioEscolha == UsuarioEscolha.Login
                      ? null
                      : (_password) {
                          final password = _password ?? '';
                          if (password != _passwordForm.text) {
                            return 'Senhas informadas não conferem.';
                          }
                          return null;
                        },
                    decoration: const InputDecoration(
                      labelText: 'Confirmação de senha',
                      labelStyle: TextStyle(
                        fontSize: 20
                      )
                    ),
                  )
                  
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                      
                     [ 
                      if(loginProgresso)
                        CircularProgressIndicator()
                      else
                      ElevatedButton(
                        onPressed: submit,
                         child: Text('Entra',
                         style: TextStyle(
                            fontSize: 20
                         ),
                         ),
                         style: ElevatedButton.styleFrom(
                          
                            padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                            
                          ),
                         ),
                        ),
                        SizedBox(height: 25,),
                        ElevatedButton(
                        onPressed: (){
                          troca();
                        },
                        child: Text(login() ? 'Registre-se' : 'Ja tem uma conta?',
                         style:const TextStyle(
                            fontSize: 20
                         ),
                         ),
                         style: ElevatedButton.styleFrom(
                          
                            padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                         ),
                          
                        )
                      ],
                  )
                 
                ],
                )
              );
                  }
                  }