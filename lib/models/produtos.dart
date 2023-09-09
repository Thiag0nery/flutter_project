import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:project_teste/models/produto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class   Produto with ChangeNotifier{
  final List<Produto_class> _items = [];

  List<Produto_class> get items => [..._items];
  

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();

    final response = await http.get(
      Uri.parse('https://projeto-1612f-default-rtdb.firebaseio.com/.json'),
    );
    
    if (response.body == 'null') return;
    
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    data.forEach((productId, productData) {
      _items.add(
        Produto_class(
          nome: productData['name'],
          valor: productData['valor'],
          quantidade: productData['quantidade'] as String,
          
        ),
      );
    });
    notifyListeners();
  }
  
}