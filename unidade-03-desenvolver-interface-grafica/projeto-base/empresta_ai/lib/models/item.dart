/// Camada Model: só dados, em Dart puro.
/// Não importa nada do Flutter — como o item aparece na tela
/// (ícone, cor) é decisão da View.
class Item {
  final String id;
  final String nome;
  final String categoria;
  final String dono;
  final String apartamento;
  bool disponivel;

  Item({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.dono,
    required this.apartamento,
    this.disponivel = true,
  });
}
