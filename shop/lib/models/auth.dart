import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB_xOFJbTXxRRWdJmSU8pk8oMdidrlKBW8';

  Future<void> _authenticate(
      String email, String password, String signInSignUp) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$signInSignUp?key=AIzaSyB_xOFJbTXxRRWdJmSU8pk8oMdidrlKBW8';
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    //print(jsonDecode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
  }
}
