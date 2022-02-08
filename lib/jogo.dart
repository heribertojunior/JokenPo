import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção:";
  void opSelecionada(String escolhaUser) {
    var op = ["pedra", "papel", "tesoura"];
    var atual = op[Random().nextInt(3)];

    setState(() {
      this._imagemApp = AssetImage("images/" + atual + ".png");
    });

    switch (escolhaUser) {
      case "pedra":
        switch (atual) {
          case "pedra":
            setState(() {
              this._mensagem = "empate";
            });
            break;
          case "tesoura":
            this._mensagem = "ganhou";
            break;
          case "papel":
            this._mensagem = "perdeu";
            break;
        }
        break;
      case "papel":
        switch (atual) {
          case "pedra":
            this._mensagem = "ganhou";
            break;
          case "tesoura":
            this._mensagem = "perdeu";
            break;
          case "papel":
            this._mensagem = "empate";
            break;
        }
        break;
      case "tesoura":
        switch (atual) {
          case "pedra":
            this._mensagem = "perdeu";
            break;
          case "tesoura":
            this._mensagem = "empate";
            break;
          case "papel":
            this._mensagem = "ganhou";
            break;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "JokenpoGame",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          //imagem
          //resultado
          //linha
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp, height: 100),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  opSelecionada("pedra");
                },
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () {
                  opSelecionada("papel");
                },
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () {
                  opSelecionada("tesoura");
                },
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
