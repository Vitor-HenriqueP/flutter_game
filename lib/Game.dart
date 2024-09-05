import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  final Map<String, AssetImage> _opcoesImagens = {
    "pedra": AssetImage("assets/pedra.png"),
    "papel": AssetImage("assets/papel.png"),
    "tesoura": AssetImage("assets/tesoura.png"),
  };
  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var number = Random().nextInt(3); //gerando numero aleatorio entre 0 e 2
    var escolhaApp = opcoes[number];
    print("Escolha do app: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);

    setState(() {
      this._imageApp = _opcoesImagens[escolhaApp]!;
    });

    //regra do jogo
    if ((escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura")) {
      setState(() {
        this._mensagem = "Você ganhou! =)";
      });
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu! =(";
      });
    } else {
      setState(() {
        this._mensagem = "Empatou! =|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imageApp,
            ),
          Padding(
             padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image(
                  image: _opcoesImagens["pedra"]!,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image(
                  image: _opcoesImagens["papel"]!,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image(
                  image: _opcoesImagens["tesoura"]!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
