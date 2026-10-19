import 'package:flutter/foundation.dart';

/// Camada Controller da sessão: quem está usando o app e as regras de entrada.
/// As regras de validação ficam aqui, não na tela: a View só mostra a mensagem.
class SessaoController extends ChangeNotifier {
  static final _formatoApartamento = RegExp(r'^[A-Za-z]-?\d{3}$');
  static final _formatoSenha = RegExp(r'^\d{4}$');

  String? _apartamento;

  String? get apartamento => _apartamento;
  bool get logado => _apartamento != null;

  /// Retorna a mensagem de erro, ou null se o valor for válido.
  String? validarApartamento(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Informe seu bloco e apartamento.';
    }
    if (!_formatoApartamento.hasMatch(valor.trim())) {
      return 'Use o formato bloco-número, como A-302.';
    }
    return null;
  }

  String? validarSenha(String? valor) {
    if (valor == null || !_formatoSenha.hasMatch(valor)) {
      return 'A senha tem exatamente 4 números.';
    }
    return null;
  }

  /// Retorna true se entrou. A conferência real da senha fica para a UC4.
  bool entrar(String apartamento, String senha) {
    if (validarApartamento(apartamento) != null ||
        validarSenha(senha) != null) {
      return false;
    }
    _apartamento = apartamento.trim().toUpperCase();
    notifyListeners();
    return true;
  }

  void sair() {
    _apartamento = null;
    notifyListeners();
  }
}
