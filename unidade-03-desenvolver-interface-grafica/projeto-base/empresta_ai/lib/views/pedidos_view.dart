import 'package:flutter/material.dart';

import '../controllers/itens_controller.dart';
import '../tema/tema.dart';
import '../widgets/icone_categoria.dart';

/// Itens que o morador pegou emprestado.
class PedidosView extends StatelessWidget {
  const PedidosView({super.key, required this.controller});

  final ItensController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final pedidos = controller.meusPedidos;
        if (pedidos.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(TemaEmprestaAi.espacoG),
              child: Text(
                'Você ainda não pediu nada.\nToque em "Itens" para procurar.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(TemaEmprestaAi.espacoM),
          children: [
            Text('Meus pedidos',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TemaEmprestaAi.espacoM),
            for (final item in pedidos)
              ListTile(
                leading: Icon(iconeDaCategoria(item.categoria)),
                title: Text(item.nome),
                subtitle: Text('Com você · devolver para ${item.dono}'),
                trailing: TextButton(
                  onPressed: () => controller.devolver(item),
                  child: const Text('Devolvi'),
                ),
              ),
          ],
        );
      },
    );
  }
}
