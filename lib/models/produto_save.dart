import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProtudoSave with ChangeNotifier{

  Future<void> addProduct(String nome, String valor, String quantidade) async {
    final response = await http.post(
      Uri.parse('https://projeto-1612f-default-rtdb.firebaseio.com/.json'),
      body: jsonEncode(
        {
          "name":nome,
          "valor": valor,
          "quantidade": quantidade,
        },
      ),
    );
    notifyListeners();
  }
}