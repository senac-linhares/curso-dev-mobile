import 'package:flutter/material.dart';

import '../models/item.dart';

/// Dados de exemplo. Persistência de verdade fica para a UC4.
List<Item> itensDeExemplo() => [
      Item(id: '1', nome: 'Furadeira de impacto', categoria: 'Ferramentas', dono: 'Seu Antônio', apartamento: 'B-104', icone: Icons.handyman),
      Item(id: '2', nome: 'Escada de alumínio (7 degraus)', categoria: 'Ferramentas', dono: 'Dona Ilza', apartamento: 'A-201', icone: Icons.stairs),
      Item(id: '3', nome: 'Carrinho de compras', categoria: 'Casa', dono: 'Marta', apartamento: 'C-302', icone: Icons.shopping_cart),
      Item(id: '4', nome: 'Panela de pressão 7 L', categoria: 'Cozinha', dono: 'Sr. Joaquim', apartamento: 'A-302', icone: Icons.soup_kitchen, disponivel: false),
      Item(id: '5', nome: 'Barraca para 4 pessoas', categoria: 'Lazer', dono: 'Rafael', apartamento: 'B-208', icone: Icons.holiday_village),
      Item(id: '6', nome: 'Cadeira de praia', categoria: 'Lazer', dono: 'Rafael', apartamento: 'B-208', icone: Icons.chair),
    ];
