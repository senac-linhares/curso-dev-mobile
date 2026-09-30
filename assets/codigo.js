/* Desenvolvedor Mobile — Senac Linhares
   Coloração de sintaxe do Dart, para os blocos de código das apostilas.

   Use junto com o assets/codigo.css, que tem as cores e as instruções de uso:

     <link rel="stylesheet" href="../assets/codigo.css">
     <script defer src="../assets/codigo.js"></script>

   Só colore o que estiver marcado com a classe "codigo" (veja o porquê no
   codigo.css). Feito à mão, sem biblioteca externa, para as apostilas
   continuarem funcionando offline e sem depender de CDN.

   No HTML, o código dentro do <pre> segue sendo Dart puro: para acrescentar
   um exemplo novo, basta colar o código (com &lt; e &gt; escapados) que ele
   é colorido sozinho quando a página abre. Se o JavaScript não rodar, o bloco
   continua legível — só fica sem cores. */

(function () {
  'use strict';

  var CONTROLE = ['if', 'else', 'for', 'while', 'do', 'switch', 'case', 'default',
    'break', 'continue', 'return', 'yield', 'await', 'async', 'try', 'catch',
    'finally', 'throw', 'rethrow', 'assert', 'in', 'is', 'as', 'when'];

  var DECLARA = ['abstract', 'class', 'const', 'covariant', 'deferred', 'dynamic',
    'enum', 'export', 'extends', 'extension', 'external', 'factory', 'final',
    'get', 'hide', 'implements', 'interface', 'import', 'late', 'library', 'mixin',
    'new', 'on', 'operator', 'part', 'required', 'sealed', 'set', 'show', 'static',
    'super', 'this', 'typedef', 'var', 'void', 'with', 'true', 'false', 'null'];

  var TIPOS = ['int', 'double', 'bool', 'num'];

  /* A ordem das alternativas importa: comentário e texto entre aspas vêm
     primeiro para que uma palavra-chave escrita dentro deles não seja colorida. */
  var re = new RegExp(
    '(\\/\\/[^\\n]*)' +                                    /*  1 comentário      */
    '|("(?:\\\\.|[^"\\\\])*"|\'(?:\\\\.|[^\'\\\\])*\')' +  /*  2 entre aspas     */
    '|(@[A-Za-z_]\\w*)' +                                  /*  3 anotação        */
    '|\\b(' + CONTROLE.join('|') + ')\\b' +                /*  4 controle        */
    '|\\b(' + DECLARA.join('|') + ')\\b' +                 /*  5 declaração      */
    '|\\b(' + TIPOS.join('|') + ')\\b' +                   /*  6 tipo básico     */
    '|\\b(\\d[\\d.]*)\\b' +                                /*  7 número          */
    '|\\b([A-Z][A-Za-z0-9_]*)\\b' +                        /*  8 classe / tipo   */
    '|\\b([a-z_]\\w*)(?=\\()' +                            /*  9 função          */
    '|\\b([a-z_]\\w*)(?=\\s*:)',                           /* 10 parâmetro       */
    'g');

  /* mesma numeração dos grupos acima; o 2 é tratado à parte, em aspas() */
  var CLASSES = [null, 'c-com', null, 'c-ano', 'c-kw', 'c-dec', 'c-tipo',
    'c-num', 'c-tipo', 'c-fn', 'c-prop'];

  function esc(texto) {
    return texto.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  function marca(classe, texto) {
    return '<span class="' + classe + '">' + esc(texto) + '</span>';
  }

  /* Dentro de um texto entre aspas, $nome e ${conta} ganham cor própria, como
     no editor. O \$ escapado é deixado de fora de propósito: ele é um cifrão
     comum (usado em "R\$ 10,00"), não uma variável. */
  function aspas(bruto) {
    var saida = '', fim = 0, m;
    var r = /(\\.)|(\$\{[^}]*\}|\$[A-Za-z_]\w*)/g;
    while ((m = r.exec(bruto)) !== null) {
      if (m[2]) {
        saida += esc(bruto.slice(fim, m.index)) + marca('c-int', m[2]);
        fim = m.index + m[0].length;
      }
    }
    return '<span class="c-str">' + saida + esc(bruto.slice(fim)) + '</span>';
  }

  function colorir(bloco) {
    var codigo = bloco.textContent;
    var saida = '', fim = 0, m, i;
    re.lastIndex = 0;
    while ((m = re.exec(codigo)) !== null) {
      saida += esc(codigo.slice(fim, m.index));
      if (m[2] !== undefined) {
        saida += aspas(m[2]);
      } else {
        for (i = 1; i < CLASSES.length; i++) {
          if (CLASSES[i] && m[i] !== undefined) { saida += marca(CLASSES[i], m[i]); break; }
        }
      }
      fim = m.index + m[0].length;
    }
    bloco.innerHTML = saida + esc(codigo.slice(fim));
  }

  function rodar() {
    var blocos = document.querySelectorAll('.codigo pre, pre.codigo');
    Array.prototype.forEach.call(blocos, colorir);
  }

  /* funciona tanto com defer no <head> quanto solto no fim do <body> */
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', rodar);
  } else {
    rodar();
  }
})();
