import 'package:flutter/material.dart';
class Produto_class with ChangeNotifier {
  final String nome;
  final String valor;
  final String quantidade;
  

  Produto_class({
    
    required this.nome,
    required this.valor,
    required this.quantidade,
  });
}