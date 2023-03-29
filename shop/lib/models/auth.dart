import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB_xOFJbTXxRRWdJmSU8pk8oMdidrlKBW8';

  Future<void> _authenticate(
      String email, String password, String signInSignUp) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$signInSignUp?key=AIzaSyB_xOFJbTXxRRWdJmSU8pk8oMdidrlKBW8';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }
    //print(jsonDecode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
