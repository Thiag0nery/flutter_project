import 'package:flutter/material.dart';
import 'login_form.dart';


void main() {
  runApp(const LoginRegister());
}
class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
      
        body:
        Container(
           decoration: const BoxDecoration(
            gradient:  LinearGradient(
              end: Alignment.bottomLeft,
              colors: [Color.fromARGB(255, 164, 188, 228), Color.fromARGB(240, 33, 136, 221)]
            )
           ),
          
          child:
          Center(
           
          child:
            Opacity( 
              opacity: 0.5,
              child:
           Container(
            width: 600,
            height: 450,
            
            
            decoration: BoxDecoration(
              color: Colors.white,
              
              borderRadius: BorderRadius.circular(10),
              boxShadow:[ BoxShadow(
                 color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 10 ,
                  blurRadius: 15,
                  offset: const Offset(0, 2), // changes position of shadow
              )]
            ),
              
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
           

              child: const LoginForm()
              )
             
         
        ),
        )

        )
        
         
      ),
    );
  }
}