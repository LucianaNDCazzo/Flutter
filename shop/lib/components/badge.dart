import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badge(
      {required this.child, required this.value, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [child],
    );
  }
}
