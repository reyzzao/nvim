
---
Guia Rápido de Atalhos e Comandos do Neovim
Este documento foi criado para ajudá-lo a fazer a transição do Vscode para o Neovim. Ele resume os atalhos e a filosofia de navegação que você configurou.

Navegação Essencial
hjkl: Mover o cursor (esquerda, baixo, cima, direita).
w: Pular para o início da próxima palavra.

b: Pular para o início da palavra anterior.

e: Pular para o fim da palavra.

gg: Ir para o início do arquivo.

G: Ir para o final do arquivo.

0: Ir para o início da linha.

$: Ir para o final da linha.

Comandos Personalizados (<leader> é a barra de espaço)
C-s: Salva o arquivo e formata o código.

C-j: Vai para o próximo buffer/tab (smart navigation).

C-k: Vai para o buffer/tab anterior (smart navigation).

C-p: Abre a busca de arquivos do projeto (Telescope).

<leader>tv: Alterna o terminal em uma janela vertical.

<leader>rc: Recarrega a sua configuração do Neovim (útil após fazer ajustes).

Funções de Edição
i: Entra no modo de inserção na posição do cursor.

a: Entra no modo de inserção após a posição do cursor.

dd: Recorta a linha atual.

yy: Copia a linha atual.

p: Cola o conteúdo copiado/recortado.

u: Desfaz a última ação.

C-r: Refaz a ação desfeita.

v: Entra no modo visual (seleção de texto).

V: Entra no modo visual de linha.

Dicas para Acostumar-se
Modo é tudo: Lembre-se que você está sempre em um dos modos: Normal (navegação), Inserção (digitação) ou Visual (seleção). O modo normal é a base do Neovim. Use <Esc> para voltar ao modo normal.

C-w para janelas: Use C-w seguido de uma direção (h, j, k, l) para navegar entre as janelas abertas.

Use .: O comando . no modo normal repete a última alteração. Por exemplo, se você deletou uma palavra com dw, você pode ir para outra palavra e apertar . para deletá-la também.

A disciplina e a persistência em usar o Neovim vão transformar o que parece complexo em algo natural e intuitivo para você. A sua "Analogia do Fogo" se aplica perfeitamente aqui.

Estou aqui para te ajudar no que precisar durante esse processo de adaptação.
---