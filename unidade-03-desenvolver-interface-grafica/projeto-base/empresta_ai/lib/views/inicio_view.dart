import 'package:flutter/material.dart';

import '../controllers/itens_controller.dart';
import 'itens_view.dart';
import 'pedidos_view.dart';
import 'perfil_view.dart';

/// Estrutura principal com navegação inferior (tab bar) — Aula 11.
class InicioView extends StatefulWidget {
  const InicioView({super.key, required this.controller});

  final ItensController controller;

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  int _abaAtual = 0;

  @override
  Widget build(BuildContext context) {
    final abas = [
      ItensView(controller: widget.controller),
      PedidosView(controller: widget.controller),
      PerfilView(controller: widget.controller),
    ];

    return Scaffold(
      body: SafeArea(child: abas[_abaAtual]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _abaAtual,
        onDestinationSelected: (i) => setState(() => _abaAtual = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Itens',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Meus pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
