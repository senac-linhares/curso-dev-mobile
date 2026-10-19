import 'package:flutter/material.dart';

class TelaImc extends StatefulWidget {
  const TelaImc({super.key});

  @override
  State<StatefulWidget> createState() => _TelaImc();
}

class _TelaImc extends State<TelaImc>{
  
  final _peso = TextEditingController();
  final _altura = TextEditingController();

  double resultado = 0;
  String imagemImc = "";

  void calcularImc(){
    var peso = double.parse(_peso.text);
    var altura = double.parse(_altura.text);

    var total = peso / (altura * altura);

    setState(() {
      resultado = total;
      if(total < 18.5){
        imagemImc = "assets/imc1.png";
      } else if(total < 24.9){
        imagemImc = "assets/imc2.png";
      }
    });     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora IMC")),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _altura,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Altura",
                suffixText: "cm"
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _peso,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Peso",
                suffixText: "Kg"
              ),
            ),
            SizedBox(height: 50),
            FilledButton(              
              onPressed: calcularImc,
              child: Text("Calcular IMC"),
            ),
            
            SizedBox(height: 50),
  
            Text(
              "Seu IMC é de: ${resultado.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.red,
                fontFamily: "Arial",
              ),
            ),
          ],
        )
      ),
    );
  }
  
}
