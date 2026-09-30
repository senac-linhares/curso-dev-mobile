# Publicar novas unidades e manter o site

Este documento é para quem mantém o repositório (o professor), não para os alunos. As instruções para os alunos ficam no [README](../README.md).

## Estrutura do repositório

```
curso-dev-mobile/
├── .nojekyll                                     (impede o GitHub de processar os .md com Jekyll)
├── README.md                                      (porta de entrada, escrita para os alunos)
├── index.html                                     (portal do curso, publicado pelo GitHub Pages)
├── assets/
│   ├── style.css                                  (estilo compartilhado por todas as páginas)
│   ├── codigo.css                                 (blocos de código com cara de editor + cores de sintaxe)
│   ├── codigo.js                                  (colore o Dart dos blocos de código)
│   ├── apostila.css                               (moldura e passos das animações explicativas)
│   └── apostila.js                                (barra de progresso, sumário ativo e player das animações)
├── unidade-01-elaborar-projetos-de-aplicacoes/
│   ├── index.html                                 (índice da unidade)
│   ├── apresentacao-das-aulas.html
│   ├── apostila-do-aluno.html
│   ├── simulador-briefing-empresario.html          (versão estilizada, com botão de download)
│   └── simulador-briefing-empresario.md            (arquivo original, para baixar e subir numa IA)
└── unidade-02-.../                                (próximas unidades seguem o mesmo padrão)
```

O site publicado (GitHub Pages) é: **https://senac-linhares.github.io/curso-dev-mobile/**

## Materiais feitos para usar com uma IA (arquivos .md)

Quando um material é um prompt/roteiro para colar ou subir num assistente de IA (como o simulador de briefing da unidade 01), mantenha os dois formatos: uma página HTML estilizada para o aluno ler as instruções de uso, **e** o arquivo `.md` original ao lado, com um botão de download na página. Não peça para o aluno copiar o texto da página HTML — ao copiar de uma página estilizada, o menu do site, o rodapé e outros elementos vêm junto, e a formatação markdown (`#`, `**`, listas) que a IA espera de entender já foi convertida em HTML. O `.md` puro é o formato que funciona direto em qualquer chat de IA.

## Como adicionar uma nova unidade de conteúdo (apostila, slides etc.)

1. Crie uma pasta nova na raiz seguindo o padrão `unidade-02-nome-da-unidade/` (sem espaços, sem acentos, tudo minúsculo, palavras separadas por hífen).
2. Coloque dentro dela um `index.html` da unidade (pode copiar o da unidade 01 como ponto de partida e trocar os textos e links) e os materiais em HTML.
3. No `index.html` da raiz, adicione um novo bloco `cartao-unidade` linkando para essa pasta (substitua o bloco "Próximas unidades" ou adicione um novo antes dele).
4. Atualize a lista de unidades no `README.md` também.
5. Suba as mudanças:

   ```
   git add .
   git commit -m "Adiciona unidade 02"
   git push
   ```

   O GitHub Pages atualiza o site sozinho em cerca de 1 minuto.

## Blocos de código nas apostilas

Quando uma página tiver exemplos de código Dart, reaproveite o componente que já existe em `assets/` em vez de escrever estilo novo. Ele deixa o código com a aparência do editor (paleta Dark+ do VS Code), colore a sintaxe sozinho e imprime em versão clara.

Ligue os dois arquivos no `<head>`, **antes** do `<style>` da própria página (assim os ajustes locais da página continuam podendo sobrescrever o componente):

```html
<link rel="stylesheet" href="../assets/codigo.css">
<script defer src="../assets/codigo.js"></script>
```

E marque o que é código com a classe `codigo`:

```html
<div class="tpl codigo">
  <div class="tpl-head"><h4>lib/main.dart</h4></div>
  <pre>void main() {}</pre>
</div>
```

Para um trecho solto, sem cabeçalho, use `<pre class="codigo">`.

Dois detalhes que evitam dor de cabeça:

- **Escape `<` e `>` como `&lt;` e `&gt;`** dentro do `<pre>`. Sem isso o navegador tenta ler `List<String>` como uma tag HTML e o bloco quebra.
- **A classe `codigo` é obrigatória de propósito.** Sem ela nada é colorido, e isso é intencional: se a coloração pegasse qualquer `<pre>`, um modelo de texto em português viraria bagunça, porque "final", "do", "as" e "in" também são palavras-chave do Dart, todo número seria pintado e toda palavra com maiúscula viraria nome de classe. Assim a mesma página pode ter um modelo para o aluno preencher e um exemplo de Dart, cada um com a aparência certa.

Acrescentar exemplos novos não exige mexer no CSS nem no JS: cole o Dart dentro do `<pre>` que ele é colorido quando a página abre. O único cuidado é que a apostila deixa de funcionar isolada — ela passa a depender da pasta `assets/` ao lado, o que é o normal no site publicado.

## Sumário que marca o item atual, barra de progresso e animações

O `assets/apostila.js` traz três comportamentos prontos para as apostilas. Ligue-o junto com o CSS:

```html
<link rel="stylesheet" href="../assets/apostila.css">
<script defer src="../assets/apostila.js"></script>
```

Cada um liga sozinho, só se a página tiver o elemento correspondente:

| Comportamento | Precisa de |
|---|---|
| Barra de progresso de leitura | um elemento com `id="prog"` |
| Destaque do item atual no sumário | um `id="toc"` com links `#âncora` apontando para os títulos |
| Animações explicativas | uma ou mais `<figure class="anim">` |

O destaque do sumário só acrescenta a classe `ativo` ao link; **como** ele fica marcado é decisão do CSS de cada apostila (a regra `nav.sumario a.ativo`).

### Fazendo uma animação

```html
<figure class="anim" data-duracao="4300">
  <div class="anim-head">
    <span class="anim-tag">Animação</span>
    <button class="btn" type="button">Tocar</button>
  </div>
  <svg ...> <g class="s1">...</g> <g class="s2">...</g> </svg>
  <figcaption>O que a animação mostra.</figcaption>
</figure>
```

As classes `s1` a `s10` fazem os elementos aparecerem em sequência, um a cada meio segundo. Para passos próprios, escreva os `@keyframes` no `<style>` da página e prenda-os a `.tocando #id-do-elemento`. O `data-duracao` (em milissegundos) é só o tempo total, usado para o botão voltar a dizer "Repetir" no fim — mantenha-o em dia se mexer nos tempos.

A animação toca sozinha na primeira vez que aparece na tela, e o botão repete.

**Regra ao desenhar:** a animação precisa fazer sentido **parada**. Quem pediu menos animação no sistema (`prefers-reduced-motion`) e quem imprime a apostila vê tudo de uma vez, no estado final. Por isso nunca empilhe dois textos no mesmo lugar contando que um vai sumir — lado a lado, o desenho continua legível.

## Como adicionar uma unidade técnica com código de projeto

Unidades mais avançadas provavelmente vão trazer código de aplicativos, não só apostilas. Nesse caso:

1. Crie a pasta da unidade do mesmo jeito (`unidade-0X-nome/`), mas dentro dela organize o projeto como um projeto de código normal (ex: `unidade-05-meu-app/codigo/` com o projeto completo, e um `README.md` próprio explicando como rodar).
2. Se fizer sentido publicar uma versão navegável do projeto (por exemplo, um app web), publique o build/export dentro dessa pasta e linke a partir do `index.html` da unidade — o GitHub Pages serve qualquer HTML estático encontrado no repositório.
3. Se o projeto não for algo que roda no navegador (ex: um app Android nativo), a pasta da unidade não precisa ter site nenhum — só o código e um README explicando o projeto. Nesse caso, o card dessa unidade no portal pode linkar direto para a pasta do código no GitHub em vez de uma página HTML.
4. Sempre mantenha um `README.md` dentro da pasta da unidade explicando, em linguagem simples, o que é o projeto e como abrir/rodar.

## O que fica de fora do repositório

Só o que é destinado aos alunos entra aqui. Materiais internos do professor (planos de aula, PTDs, guia do instrutor etc.) não devem ser copiados para esta pasta.

## Publicação inicial (referência histórica)

O repositório foi criado pela organização `senac-linhares` e o GitHub Pages foi ativado em **Settings → Pages → Deploy from a branch → `main` → `/ (root)`**. Se precisar recriar isso do zero em outro repositório, esse é o caminho.
