import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 142, 36, 228),
                  Color.fromRGBO(8, 240, 170, 0.898),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 70,
                      ),
                      //cascade operator..
                      transform: Matrix4.rotationZ(-8 * pi / 180)
                        ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 142, 36, 228),
                          Color.fromRGBO(8, 240, 170, 0.898),
                        ]),
                        //color: const Color.fromRGBO(8, 240, 170, 0.898),
                        //boxShadow: const [
                        //  BoxShadow(
                        //    blurRadius: 8,
                        //    color: Colors.black54,
                        //    offset: Offset(0, 2),
                        //  ),
                        //],
                      ),
                      child: const Text(
                        'Minha loja',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Anton',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const AuthForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
