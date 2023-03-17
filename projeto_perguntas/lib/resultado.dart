import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //const Resultado({super.key});
  final int pontuacao;
  final void Function() qdoReiniciarQuest;

  Resultado(this.pontuacao, this.qdoReiniciarQuest);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: Text('Reiniciar'),
            onPressed: qdoReiniciarQuest)
      ],
    );
  }
}
