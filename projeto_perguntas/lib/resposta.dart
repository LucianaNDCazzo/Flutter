import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //const Resposta({super.key});
  final String texto;
  final void Function() qdoSelecionado;

  const Resposta(this.texto, this.qdoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        onPressed: qdoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
