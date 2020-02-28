import 'package:flutter/material.dart';
import 'package:flutter_notas_diarias/helper/anotacaoHelper.dart';
import 'package:flutter_notas_diarias/model/anotacao.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  var _db = AnotacaoHelper();

  _exibirTelaCadastro() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Adicionar Anotação"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _tituloController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Título", hintText: "Digite o título..."),
              ),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                    labelText: "Descrição", hintText: "Digite a descrição..."),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  _tituloController.text = "";
                  _descricaoController.text = "";
                },
                child: Text("Cancelar")),
            FlatButton(
              onPressed: () {
                _salvarAnotacao();
                Navigator.pop(context);
              },
              child: Text("Salvar"),
            )
          ],
        );
      },
    );
  }

  _salvarAnotacao() async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;
    Anotacao anotacao = Anotacao(
        titulo: titulo, descricao: descricao, data: DateTime.now().toString());
    int resultado = await _db.salvarAnotacao(anotacao);
    print("salvar anotacao: " + resultado.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTelaCadastro();
        },
      ),
    );
  }
}
