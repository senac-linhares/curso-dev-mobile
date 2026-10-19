import 'package:flutter/material.dart';

import 'controllers/itens_controller.dart';
import 'controllers/sessao_controller.dart';
import 'tema/tema.dart';
import 'views/entrada_view.dart';

/// Raiz do aplicativo: cria os controllers e define tema e primeira tela.
class EmprestaAiApp extends StatefulWidget {
  const EmprestaAiApp({super.key});

  @override
  State<EmprestaAiApp> createState() => _EmprestaAiAppState();
}

class _EmprestaAiAppState extends State<EmprestaAiApp> {
  // Camada Controller do MVC: um controller por assunto.
  final SessaoController _sessao = SessaoController();
  final ItensController _itens = ItensController();

  @override
  void dispose() {
    _sessao.dispose();
    _itens.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empresta Aí',
      debugShowCheckedModeBanner: false,
      theme: TemaEmprestaAi.claro(),
      darkTheme: TemaEmprestaAi.escuro(),
      home: EntradaView(sessao: _sessao, itens: _itens),
    );
  }
}
