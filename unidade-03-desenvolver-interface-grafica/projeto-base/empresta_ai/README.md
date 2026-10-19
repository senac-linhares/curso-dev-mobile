# Empresta Aí — projeto-base da UC 03

Este é o aplicativo de exemplo que acompanha a apostila da **UC 03 — Desenvolver interface gráfica para dispositivos móveis**. Ele é a versão em Flutter do caso Empresta Aí (o app de empréstimo entre vizinhos da Dona Ilza, que vocês conhecem desde a UC 01).

Use-o para **consultar como algo foi feito** — um formulário com validação, uma lista com busca, uma navegação por abas — e depois faça do seu jeito no aplicativo da sua squad. Não é para copiar e entregar: o projeto de vocês tem outros requisitos e outros wireframes.

## O que tem aqui

```
lib/
├── main.dart                 ponto de partida: runApp(...)
├── app.dart                  MaterialApp, tema e primeira tela
├── tema/tema.dart            guia de estilo em código: cores, espaçamentos, botões
├── models/item.dart          MODEL — os dados de um item, em Dart puro
├── dados/itens_exemplo.dart  itens de mentira para preencher as telas
├── controllers/              CONTROLLER — regras e estado, um por assunto
│   ├── itens_controller.dart busca, pedir, devolver
│   └── sessao_controller.dart entrar, sair e regras de validação
├── views/                    VIEW — uma tela por arquivo
│   ├── entrada_view.dart     tela de entrada (formulário; usa as regras da sessão)
│   ├── inicio_view.dart      navegação inferior com 3 abas
│   ├── itens_view.dart       lista de itens com busca
│   ├── item_detalhe_view.dart detalhe + confirmação + SnackBar
│   ├── pedidos_view.dart     itens que o morador pegou
│   └── perfil_view.dart      perfil e menu secundário
└── widgets/                  VIEW — pedaços reutilizáveis de tela
    ├── item_card.dart        cartão de item (com Semantics)
    └── icone_categoria.dart  qual ícone representa cada categoria
test/
├── controllers_test.dart     testes das regras, sem abrir tela
└── widget_test.dart          testes de tela e de acessibilidade
```

## Como rodar

Este repositório guarda só o código Dart. As pastas de cada plataforma (`android/`, `ios/`, `web/`) são geradas na sua máquina com um comando:

1. Copie a pasta `empresta_ai` para um lugar fora do OneDrive (por exemplo `C:\projetos\empresta_ai`). Caminhos com espaços ou sincronizados costumam dar erro de build.
2. Abra um terminal dentro da pasta e rode:

   ```
   flutter create .
   flutter pub get
   flutter run
   ```

   O `flutter create .` só cria o que está faltando; ele não apaga o seu `lib/`.
3. Com o emulador aberto, o app sobe na tela de entrada. Use qualquer apartamento no formato `A-302` e uma senha de 4 números.

Para rodar os testes:

```
flutter test
```

## Vocabulário rápido

- **Hot reload** (tecla `r` no terminal, ou salvar o arquivo no VS Code): aplica a mudança na tela sem perder o que você digitou.
- **Hot restart** (tecla `R`): reinicia o app do zero.
- **`flutter doctor`**: diagnostica o que está faltando na instalação.
