-- @file: ~/.config/nvim/lua/keymaps/explorer.lua

local map = vim.keymap.set

-- Mapeamento para o plug explorer : neo-tree
map('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Alternar Neo-tree >> Para: quer a árvore de arquivos ao lado, como uma barra lateral fixa. É o jeito mais comum e tradicional.' })
map('n', '<leader>ne', ':Neotree float<CR>', { desc = 'Alternar Neo-tree Flutuante >> Para : dar uma OLHADINHA rápida nos arquivos sem bagunçar a sua tela. A janela flutuante aparece por cima do seu código e some quando você a fecha.'  })   
  

  
--[[   
### Atalhos e Ferramentas do Neo-tree
Aqui está uma lista dos atalhos e das principais funcionalidades do neo-tree para você dominar a navegação.

Atalhos Comuns (Dentro da Árvore de Arquivos)
Atalho	Ação
l ou <CR>	Abrir o arquivo ou entrar no diretório.
h	Subir um nível de diretório.
j	Mover para baixo.
k	Mover para cima.
a	Criar um novo arquivo ou diretório.
d	Deletar o arquivo ou diretório selecionado.
r	Renomear o arquivo ou diretório.
s	Copiar o arquivo ou diretório.
p	Colar o arquivo ou diretório.
?	Mostrar a ajuda (lista de atalhos).

Exportar para as Planilhas
Principais Ferramentas e Funcionalidades
Modo Flutuante: O modo que você já amou! Permite abrir e fechar a árvore de arquivos como uma janela pop-up, sem alterar o layout da sua tela.

Integração com Git: Exibe o status do Git para cada arquivo e diretório (modificado, adicionado, ignorado, etc.).

Ícones de Arquivos: Usa o nvim-web-devicons para mostrar ícones bonitos e relevantes para cada tipo de arquivo.

Bookmarks (Marcadores): Permite que você marque diretórios e arquivos importantes para acessá-los rapidamente mais tarde.

Filtros: Oferece a capacidade de ocultar ou mostrar arquivos com base em padrões, como arquivos ocultos (.dotfiles) ou arquivos ignorados pelo .gitignore.

Alternar entre Modos: O neo-tree tem outros modos além da visualização de arquivos, como o de buffers abertos e de lista de histórico do Git.
   
]]
  