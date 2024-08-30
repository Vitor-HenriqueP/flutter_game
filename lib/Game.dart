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
    print("Escolha do app" + escolhaApp);
    print("Escolha do usuario" + escolhaUsuario);

    setState(() {
      this._imageApp = _opcoesImagens[escolhaApp]!;
    });

    //regra do jogo
    if ((escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura")){
          setState() {
        this._mensagem = "Você ganhou! =)";
      }
        }
      else if ((escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "pedra")) {
      setState() {
        this._mensagem = "Você perdeu! =(";
      }
      else{
        setState(){
          this._mensagem = "Empatou! =|";
        }
      }
    } 
  }
}
