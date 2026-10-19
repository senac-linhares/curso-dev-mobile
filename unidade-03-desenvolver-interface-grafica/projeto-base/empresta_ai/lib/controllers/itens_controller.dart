import 'package:flutter/foundation.dart';

import '../dados/itens_exemplo.dart';
import '../models/item.dart';

/// Camada Controller: recebe as ações da tela e altera o Model.
/// Quando algo muda, chama notifyListeners() e as telas se redesenham.
class ItensController extends ChangeNotifier {
  final List<Item> _itens = itensDeExemplo();
  final List<Item> _meusPedidos = [];
  String _busca = '';
  String? apartamentoLogado;

  List<Item> get itens {
    if (_busca.isEmpty) return List.unmodifiable(_itens);
    final termo = _busca.toLowerCase();
    return _itens
        .where((i) =>
            i.nome.toLowerCase().contains(termo) ||
            i.categoria.toLowerCase().contains(termo))
        .toList();
  }

  List<Item> get meusPedidos => List.unmodifiable(_meusPedidos);

  void buscar(String texto) {
    _busca = texto.trim();
    notifyListeners();
  }

  void entrar(String apartamento) {
    apartamentoLogado = apartamento.toUpperCase();
    notifyListeners();
  }

  /// Retorna false se o item já não estava disponível.
  bool pedir(Item item) {
    if (!item.disponivel) return false;
    item.disponivel = false;
    _meusPedidos.add(item);
    notifyListeners();
    return true;
  }

  void devolver(Item item) {
    item.disponivel = true;
    _meusPedidos.remove(item);
    notifyListeners();
  }
}
