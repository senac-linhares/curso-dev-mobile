import 'package:flutter/material.dart';

/// Camada Model: só dados, nenhuma tela.
class Item {
  final String id;
  final String nome;
  final String categoria;
  final String dono;
  final String apartamento;
  final IconData icone;
  bool disponivel;

  Item({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.dono,
    required this.apartamento,
    required this.icone,
    this.disponivel = true,
  });
}
