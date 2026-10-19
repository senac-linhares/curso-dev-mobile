import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:empresta_ai/app.dart';

void main() {
  testWidgets('Entrada recusa formulário vazio', (tester) async {
    await tester.pumpWidget(const EmprestaAiApp());
    await tester.tap(find.text('Entrar'));
    await tester.pump();
    expect(find.text('Informe seu bloco e apartamento.'), findsOneWidget);
  });

  testWidgets('Entrar mostra a lista de itens', (tester) async {
    await tester.pumpWidget(const EmprestaAiApp());
    await tester.enterText(find.byType(TextFormField).at(0), 'A-302');
    await tester.enterText(find.byType(TextFormField).at(1), '1234');
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    expect(find.text('O que você precisa hoje?'), findsOneWidget);
  });

  // Aula 15: o Flutter verifica alvos de toque e contraste automaticamente.
  testWidgets('Tela de entrada segue as diretrizes de acessibilidade',
      (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(const EmprestaAiApp());
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    handle.dispose();
  });
}
