# Publicar novas unidades e manter o site

Este documento é para quem mantém o repositório (o professor), não para os alunos. As instruções para os alunos ficam no [README](../README.md).

## Estrutura do repositório

```
curso-dev-mobile/
├── .nojekyll                                     (impede o GitHub de processar os .md com Jekyll)
├── README.md                                      (porta de entrada, escrita para os alunos)
├── index.html                                     (portal do curso, publicado pelo GitHub Pages)
├── assets/
│   └── style.css                                  (estilo compartilhado por todas as páginas)
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
