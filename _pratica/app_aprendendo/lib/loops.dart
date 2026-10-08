import 'package:flutter/material.dart';

class TelaLoop extends StatefulWidget {
  const TelaLoop({super.key});

  @override
  State<StatefulWidget> createState() => _TelaLoop();
}

class _TelaLoop extends State<TelaLoop> {
  final _numeroDigitado = TextEditingController();
  List<String> resultado = [];

  void calcular() {
    var numeroDigitado = int.tryParse(_numeroDigitado.text);

    if (numeroDigitado == null) {
      setState(() {
        resultado = ["Digite um número valido"];        
      });
    } else if (numeroDigitado < 0 || numeroDigitado > 10) {
      setState(() {
        resultado = ["Digite um número entre 0 e 10"];
      });
    }
    
    List<String>lista = [];

    for (int i = 0; i < 10; i++) {
      lista.add("$numeroDigitado * i");
    }

    setState(() {
      resultado = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aprendendo Loops")),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _numeroDigitado,
              decoration: InputDecoration(
                labelText: "Digite um valor entre 0 - 10",
              ),
            ),

            ElevatedButton(onPressed: calcular, child: Text("Calcular")),
            
            Expanded(child: ListView.builder(
              itemCount: resultado.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(resultado[index]);
              },
            ),
        ),
      ])
      )
    );
  }
}
