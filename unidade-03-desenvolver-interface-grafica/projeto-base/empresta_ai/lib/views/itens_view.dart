import 'package:flutter/material.dart';

import '../controllers/itens_controller.dart';
import '../tema/tema.dart';
import '../widgets/item_card.dart';
import 'item_detalhe_view.dart';

/// Lista de itens disponíveis no condomínio, com busca (Aulas 9 e 11).
class ItensView extends StatelessWidget {
  const ItensView({super.key, required this.controller});

  final ItensController controller;

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder redesenha a lista sempre que o controller avisa.
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final itens = controller.itens;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                TemaEmprestaAi.espacoM,
                TemaEmprestaAi.espacoM,
                TemaEmprestaAi.espacoM,
                TemaEmprestaAi.espacoP,
              ),
              child: Text(
                'O que você precisa hoje?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TemaEmprestaAi.espacoM),
              child: TextField(
                onChanged: controller.buscar,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Buscar furadeira, escada...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: TemaEmprestaAi.espacoP),
            Expanded(
              child: itens.isEmpty
                  ? const Center(
                      child:
                          Text('Nenhum item encontrado. Tente outra palavra.'))
                  : ListView.separated(
                      padding: const EdgeInsets.all(TemaEmprestaAi.espacoM),
                      itemCount: itens.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: TemaEmprestaAi.espacoP),
                      itemBuilder: (context, i) => ItemCard(
                        item: itens[i],
                        aoTocar: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ItemDetalheView(
                                item: itens[i], controller: controller),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
