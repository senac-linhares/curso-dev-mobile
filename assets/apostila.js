/* Desenvolvedor Mobile — Senac Linhares
   Comportamentos compartilhados das apostilas. Use junto com o apostila.css:

     <link rel="stylesheet" href="../assets/apostila.css">
     <script defer src="../assets/apostila.js"></script>

   São três, todos opcionais — cada um só liga se a página tiver o elemento:

     1. Barra de progresso de leitura      .... precisa de um elemento #prog
     2. Destaque do item atual no sumário  .... precisa de um #toc com links #âncora
     3. Botão que toca as animações        .... precisa de <figure class="anim">

   O destaque do sumário só acrescenta a classe "ativo" ao link; como ele fica
   marcado é decisão do CSS de cada apostila (regra nav.sumario a.ativo). */

(function () {
  'use strict';

  /* ---------- 1. Barra de progresso de leitura ---------- */
  function progresso() {
    var barra = document.getElementById('prog');
    if (!barra) return;

    function atualizar() {
      var doc = document.documentElement;
      var total = doc.scrollHeight - doc.clientHeight;
      barra.style.width = (total > 0 ? (doc.scrollTop / total) * 100 : 0) + '%';
    }
    window.addEventListener('scroll', atualizar, { passive: true });
    window.addEventListener('resize', atualizar, { passive: true });
    atualizar();
  }

  /* ---------- 2. Destaque do item atual no sumário ---------- */
  function sumario() {
    var toc = document.getElementById('toc');
    if (!toc) return;

    var links = Array.prototype.slice.call(toc.querySelectorAll('a[href^="#"]'));
    var itens = [];

    links.forEach(function (link) {
      var alvo = document.getElementById(link.getAttribute('href').slice(1));
      if (alvo) itens.push({ link: link, alvo: alvo });
    });
    if (!itens.length) return;

    var atual = null;

    function marcar() {
      /* a folga de 120px faz a troca acontecer quando o título se aproxima do
         topo, e não só quando ele encosta nele */
      var linha = window.scrollY + 120;
      var achado = null;

      for (var i = 0; i < itens.length; i++) {
        if (itens[i].alvo.getBoundingClientRect().top + window.scrollY <= linha) achado = i;
      }
      /* perto do fim da página, o último item assume: seções curtas lá embaixo
         nunca chegariam à linha de corte */
      if (window.innerHeight + window.scrollY >= document.body.scrollHeight - 2) {
        achado = itens.length - 1;
      }
      if (achado === atual) return;

      if (atual !== null) itens[atual].link.classList.remove('ativo');
      if (achado !== null) itens[achado].link.classList.add('ativo');
      atual = achado;

      if (achado !== null) rolarSumarioAte(itens[achado].link);
    }

    /* mantém o item marcado visível quando o sumário tem rolagem própria */
    function rolarSumarioAte(link) {
      if (toc.scrollHeight <= toc.clientHeight) return;
      var alto = link.offsetTop - toc.offsetTop;
      if (alto < toc.scrollTop || alto > toc.scrollTop + toc.clientHeight - link.offsetHeight) {
        toc.scrollTop = alto - toc.clientHeight / 2;
      }
    }

    window.addEventListener('scroll', marcar, { passive: true });
    window.addEventListener('resize', marcar, { passive: true });
    marcar();
  }

  /* ---------- 3. Animações ---------- */
  function animacoes() {
    var figuras = document.querySelectorAll('.anim');
    if (!figuras.length) return;

    var paradoPorPreferencia = window.matchMedia &&
      window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    function tocar(figura) {
      var botao = figura.querySelector('.anim-head .btn');
      var duracao = parseInt(figura.dataset.duracao, 10) || 6000;

      /* tirar e repor a classe reinicia a animação; ler offsetWidth no meio
         obriga o navegador a aplicar a remoção antes de repor */
      figura.classList.remove('tocando');
      void figura.offsetWidth;
      figura.classList.add('tocando');

      if (botao) {
        botao.textContent = 'Reproduzindo...';
        clearTimeout(botao._volta);
        botao._volta = setTimeout(function () { botao.textContent = 'Repetir'; }, duracao);
      }
    }

    Array.prototype.forEach.call(figuras, function (figura) {
      var botao = figura.querySelector('.anim-head .btn');
      if (botao) botao.addEventListener('click', function () { tocar(figura); });
    });

    /* toca sozinha na primeira vez que a figura aparece na tela */
    if (paradoPorPreferencia || !('IntersectionObserver' in window)) return;

    var observador = new IntersectionObserver(function (entradas) {
      entradas.forEach(function (entrada) {
        if (entrada.isIntersecting && !entrada.target.dataset.jaTocou) {
          entrada.target.dataset.jaTocou = '1';
          tocar(entrada.target);
        }
      });
    }, { threshold: 0.4 });

    Array.prototype.forEach.call(figuras, function (figura) { observador.observe(figura); });
  }

  function iniciar() {
    progresso();
    sumario();
    animacoes();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', iniciar);
  } else {
    iniciar();
  }
})();
