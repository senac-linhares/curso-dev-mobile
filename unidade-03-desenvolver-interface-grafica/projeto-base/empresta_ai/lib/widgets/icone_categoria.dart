import 'package:flutter/material.dart';

/// Decisão visual (camada View): qual ícone representa cada categoria.
IconData iconeDaCategoria(String categoria) {
  switch (categoria) {
    case 'Ferramentas':
      return Icons.handyman;
    case 'Casa':
      return Icons.home_outlined;
    case 'Cozinha':
      return Icons.soup_kitchen;
    case 'Lazer':
      return Icons.beach_access;
    default:
      return Icons.inventory_2_outlined;
  }
}
