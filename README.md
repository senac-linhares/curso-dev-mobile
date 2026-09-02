# Desenvolvedor Mobile — Senac Linhares

Instrutor: **Welton Castoldi**

Site do curso, publicado com GitHub Pages. Cada unidade curricular vira uma pasta, e o `index.html` da raiz é o portal que linka todas elas.

## Estrutura

```
curso-dev-mobile/
├── .nojekyll                                     (impede o GitHub de processar os .md com Jekyll)
├── index.html                                   (portal do curso)
├── assets/
│   └── style.css                                 (estilo compartilhado por todas as páginas)
├── unidade-01-elaborar-projetos-de-aplicacoes/
│   ├── index.html                                (índice da unidade)
│   ├── apresentacao-das-aulas.html
│   ├── apostila-do-aluno.html
│   ├── simulador-briefing-empresario.html         (versão estilizada, com botão de download)
│   └── simulador-briefing-empresario.md           (arquivo original, para baixar e subir numa IA)
└── unidade-02-.../                               (próximas unidades seguem o mesmo padrão)
```

## Materiais feitos para usar com uma IA (arquivos .md)

Quando um material é um prompt/roteiro para colar ou subir num assistente de IA (como o simulador de briefing da unidade 01), mantenha os dois formatos: uma página HTML estilizada para o aluno ler as instruções de uso, **e** o arquivo `.md` original ao lado, com um botão de download na página. Não peça para o aluno copiar o texto da página HTML — ao copiar de uma página estilizada, o menu do site, o rodapé e outros elementos vêm junto, e a formatação markdown (`#`, `**`, listas) que a IA espera de entender já foi convertida em HTML. O `.md` puro é o formato que funciona direto em qualquer chat de IA.

## Como publicar pela primeira vez

1. No GitHub, dentro da organização `senac-linhares`, crie um repositório novo chamado `curso-dev-mobile` (pode deixar como **público**, sem README nem `.gitignore` — já temos os arquivos prontos aqui).
2. No seu computador, abra um terminal dentro desta pasta (`curso-dev-mobile`) e rode:

   ```
   git init
   git add .
   git commit -m "Publica unidade 01"
   git branch -M main
   git remote add origin https://github.com/senac-linhares/curso-dev-mobile.git
   git push -u origin main
   ```

   (Se preferir, também dá para fazer isso pela interface do GitHub, arrastando a pasta inteira na tela de "upload files" do repositório recém-criado — sem precisar usar terminal.)

3. No repositório, vá em **Settings → Pages**.
4. Em "Build and deployment", escolha **Deploy from a branch**, selecione a branch `main` e a pasta `/ (root)`.
5. Salve e aguarde um minuto. O GitHub mostra o link do site (algo como `https://senac-linhares.github.io/curso-dev-mobile/`). Esse é o link para compartilhar com a turma.

## Como adicionar uma nova unidade depois

1. Crie uma pasta nova na raiz seguindo o padrão `unidade-02-nome-da-unidade/` (sem espaços, sem acentos, tudo minúsculo, palavras separadas por hífen).
2. Coloque dentro dela um `index.html` da unidade (pode copiar o da unidade 01 como ponto de partida e trocar os textos e links) e os materiais em HTML.
3. No `index.html` da raiz, adicione um novo bloco `cartao-unidade` linkando para essa pasta (substitua o bloco "Próximas unidades" ou adicione um novo antes dele).
4. Suba as mudanças:

   ```
   git add .
   git commit -m "Adiciona unidade 02"
   git push
   ```

   O GitHub Pages atualiza o site sozinho em cerca de 1 minuto.

## O que fica de fora do repositório

Só o que é destinado aos alunos entra aqui. Materiais internos do professor (planos de aula, PTDs, guia do instrutor etc.) não devem ser copiados para esta pasta.
