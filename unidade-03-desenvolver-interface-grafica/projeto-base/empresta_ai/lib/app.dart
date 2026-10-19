import 'package:flutter/material.dart';

import 'controllers/itens_controller.dart';
import 'tema/tema.dart';
import 'views/entrada_view.dart';

/// Raiz do aplicativo: define tema, título e a primeira tela.
class EmprestaAiApp extends StatefulWidget {
  const EmprestaAiApp({super.key});

  @override
  State<EmprestaAiApp> createState() => _EmprestaAiAppState();
}

class _EmprestaAiAppState extends State<EmprestaAiApp> {
  // Um único controller para o app inteiro (camada Controller do MVC).
  final ItensController _controller = ItensController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empresta Aí',
      debugShowCheckedModeBanner: false,
      theme: TemaEmprestaAi.claro(),
      darkTheme: TemaEmprestaAi.escuro(),
      home: EntradaView(controller: _controller),
    );
  }
}
