import 'dart:convert';
import 'package:flutter/material.dart';
import '../errors/auth_error.dart';
import '../home.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
   String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }
  static const _url= 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB7iux-mjoFgQupdiz-RxdYU_bqSj12tUs';
  Future<void> signup(String email, String password) async{
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      })
    );
   
     final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );
       notifyListeners();
    }
  }
  Future<void> signin(String email, String password) async{
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB7iux-mjoFgQupdiz-RxdYU_bqSj12tUs';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      })
    );
    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );
      notifyListeners();
    }
  }
}