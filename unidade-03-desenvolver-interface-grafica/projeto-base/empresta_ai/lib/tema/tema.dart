import 'package:flutter/material.dart';

/// Guia de estilo do Empresta Aí transformado em código (Aula 13).
/// Mude a cor-semente e o app inteiro acompanha.
class TemaEmprestaAi {
  static const Color corSemente = Color(0xFF00447C); // azul da agência

  /// Espaçamentos padronizados: use sempre estes valores.
  static const double espacoP = 8;
  static const double espacoM = 16;
  static const double espacoG = 24;

  static ThemeData claro() => _base(Brightness.light);
  static ThemeData escuro() => _base(Brightness.dark);

  static ThemeData _base(Brightness brilho) {
    final cores = ColorScheme.fromSeed(
      seedColor: corSemente,
      brightness: brilho,
    );
    return ThemeData(
      colorScheme: cores,
      // Botões com no mínimo 48 dp de altura: alvo de toque confortável.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      cardTheme: const CardThemeData(margin: EdgeInsets.zero),
    );
  }
}
