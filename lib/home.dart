import 'package:flutter/material.dart';
import 'package:project_teste/models/produto.dart';
import 'package:provider/provider.dart';
import 'package:project_teste/models/produtos.dart';
import 'package:project_teste/componentes/navbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  @override
  void initState() {
    super.initState();
    
    // Chame sua função aqui
    
    _refreshProducts(context);
  }
  
  Future<void> _refreshProducts(BuildContext context) async {
    return await Provider.of<Produto>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final Produto products = Provider.of(context);
    return MaterialApp(
      home: Scaffold(
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
      body:
          
          Container(child: 
            Column(

              children: [
                const Padding(padding: EdgeInsets.all(25),
                child: Text('Lista de produtos',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                  
                ),
                ),
                ),
                Expanded(
                  child:ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  
                  color: Colors.amber,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  elevation: 5,
                  child: 
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      'Nome: ${products.items[i].nome} | Valor: ${products.items[i].valor} | Quantidade: ${products.items[i].quantidade}'
                      ),
                  )
                )
              ],
            ),
          ),
                ),
                
              ],
            ),
          )
         
              
            
       
          
        ),
        
      );
        
            
            
      
        
      
     
      
    
  }
}