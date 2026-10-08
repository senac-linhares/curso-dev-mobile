import 'package:app_aprendendo/imc.dart';
import 'package:app_aprendendo/loops.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuPrimeiroApp());
}

class MeuPrimeiroApp extends StatelessWidget {
  const MeuPrimeiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp (
      title: "Calculadora IMC",
      home: TelaLoop(),
    );
  }
}

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String resultado = "";

  final TextEditingController _txtNome = TextEditingController();
  final TextEditingController _txtIdade = TextEditingController();
  final TextEditingController _txtPeso = TextEditingController();

  void calcular() {
    setState(() {
      resultado = "${_txtNome.text} tem ${_txtIdade.text} anos, e ${_txtPeso.text} kilos";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(title: Text("App em Treino")),    
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _txtNome,
                decoration: InputDecoration(
                  labelText: "Nome Completo",                
                  filled: false,                                                   
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(),                
                ),
              ),
              
              const SizedBox(height: 24),

              TextField(
                controller: _txtIdade,                
                decoration: InputDecoration(
                  labelText: "Idade",    
                  filled: true, 
                  border: OutlineInputBorder()
                ),
              ),
              
              const SizedBox(height: 24),

              TextField(
                controller: _txtPeso,
                decoration: InputDecoration(
                  labelText: "Peso",                
                  filled: false,                                                   
                  border: OutlineInputBorder(),                
                ),
              ),
               
              const SizedBox(height: 50),

               FilledButton(
                onPressed: calcular, 
                child: Text("Calcular")),
              
              const SizedBox(height: 50),

              Text(resultado)
            ],
          ),
        ),

    );
  }
}
