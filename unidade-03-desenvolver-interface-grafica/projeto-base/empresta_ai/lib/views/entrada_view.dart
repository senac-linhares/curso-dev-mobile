import 'package:flutter/material.dart';

import '../controllers/itens_controller.dart';
import '../tema/tema.dart';
import 'inicio_view.dart';

/// Tela de entrada: formulário com validação e teclado adequado (Aula 12).
class EntradaView extends StatefulWidget {
  const EntradaView({super.key, required this.controller});

  final ItensController controller;

  @override
  State<EntradaView> createState() => _EntradaViewState();
}

class _EntradaViewState extends State<EntradaView> {
  final _formKey = GlobalKey<FormState>();
  final _apartamento = TextEditingController();
  final _senha = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _apartamento.dispose();
    _senha.dispose();
    super.dispose();
  }

  void _entrar() {
    if (!_formKey.currentState!.validate()) return;
    widget.controller.entrar(_apartamento.text);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => InicioView(controller: widget.controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          // SingleChildScrollView evita que o teclado cubra os campos.
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(TemaEmprestaAi.espacoG),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.volunteer_activism, size: 72, color: cores.primary),
                  const SizedBox(height: TemaEmprestaAi.espacoM),
                  Text(
                    'Empresta Aí',
                    textAlign: TextAlign.center,
                    style: textos.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cores.primary,
                    ),
                  ),
                  const SizedBox(height: TemaEmprestaAi.espacoP),
                  Text(
                    'Peça emprestado aos seus vizinhos do Jardim das Palmeiras.',
                    textAlign: TextAlign.center,
                    style: textos.bodyLarge,
                  ),
                  const SizedBox(height: TemaEmprestaAi.espacoG),
                  TextFormField(
                    controller: _apartamento,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Bloco e apartamento',
                      hintText: 'Ex.: A-302',
                      prefixIcon: Icon(Icons.apartment),
                    ),
                    validator: (valor) {
                      if (valor == null || valor.trim().isEmpty) {
                        return 'Informe seu bloco e apartamento.';
                      }
                      if (!RegExp(r'^[A-Za-z]-?\d{3}$').hasMatch(valor.trim())) {
                        return 'Use o formato bloco-número, como A-302.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: TemaEmprestaAi.espacoM),
                  TextFormField(
                    controller: _senha,
                    obscureText: !_senhaVisivel,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _entrar(),
                    decoration: InputDecoration(
                      labelText: 'Senha (4 números)',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        tooltip: _senhaVisivel ? 'Esconder senha' : 'Mostrar senha',
                        icon: Icon(_senhaVisivel ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _senhaVisivel = !_senhaVisivel),
                      ),
                    ),
                    validator: (valor) {
                      if (valor == null || valor.length != 4) {
                        return 'A senha tem exatamente 4 números.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: TemaEmprestaAi.espacoG),
                  FilledButton(
                    onPressed: _entrar,
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
