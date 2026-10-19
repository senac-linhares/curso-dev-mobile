import '../models/item.dart';

/// Dados de exemplo. Persistência de verdade fica para a UC4.
List<Item> itensDeExemplo() => [
      Item(
          id: '1',
          nome: 'Furadeira de impacto',
          categoria: 'Ferramentas',
          dono: 'Seu Antônio',
          apartamento: 'B-104'),
      Item(
          id: '2',
          nome: 'Escada de alumínio (7 degraus)',
          categoria: 'Ferramentas',
          dono: 'Dona Ilza',
          apartamento: 'A-201'),
      Item(
          id: '3',
          nome: 'Carrinho de compras',
          categoria: 'Casa',
          dono: 'Marta',
          apartamento: 'C-302'),
      Item(
          id: '4',
          nome: 'Panela de pressão 7 L',
          categoria: 'Cozinha',
          dono: 'Sr. Joaquim',
          apartamento: 'A-302',
          disponivel: false),
      Item(
          id: '5',
          nome: 'Barraca para 4 pessoas',
          categoria: 'Lazer',
          dono: 'Rafael',
          apartamento: 'B-208'),
      Item(
          id: '6',
          nome: 'Cadeira de praia',
          categoria: 'Lazer',
          dono: 'Rafael',
          apartamento: 'B-208'),
    ];
