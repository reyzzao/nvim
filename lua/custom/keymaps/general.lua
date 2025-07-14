-- ~/.config/nvim/lua/custom/keymaps/general.lua

-- Este arquivo contém todos os mapeamentos de teclas personalizados do Neovim
-- e comandos personalizados, buscando uma experiência similar ao VS Code.

-- --- Abreviações (Substituições de Texto) ---
-- As abreviações foram movidas para um arquivo separado ou desabilitadas para evitar conflitos.
-- Este arquivo agora foca apenas em mapeamentos de teclas e comandos.

-- --- Mapeamentos de Teclas Gerais ---

-- Salvar (Ctrl+S)
vim.keymap.set({ 'n', 'i' }, '<C-s>', function()
  vim.cmd('w')
  vim.notify("Arquivo salvo!", vim.log.levels.INFO, { title = "Salvar" })
end, { desc = 'Salvar arquivo' })

-- Fechar Editor/Buffer (com confirmação padrão do Neovim)
-- Se houver alterações não salvas, o Neovim pedirá para salvar ou forçar a saída.
-- O mapeamento <C-A-k> pode ser interceptado pelo terminal.
-- vim.keymap.set('n', '<C-A-k>', ':q<CR>', { desc = 'Fechar editor (pede confirmação se modificado)' })

vim.keymap.set('n', '<C-k>', ':q<CR>', { desc = 'Fechar editor (pede confirmação)' })

-- Outra alternativa comum (se você usa <leader> key):
-- vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Fechar editor (Leader+Q, pede confirmação)' })


vim.keymap.set('n', '<A-w>', ':bd<CR>', { desc = 'Fechar buffer em foco (pede confirmação se modificado)' })
vim.keymap.set('n', '<A-q>', ':qa<CR>', { desc = 'Fechar todos os buffers (pede confirmação se modificado)' })

-- Copiar/Colar/Recortar com Clipboard do Sistema
vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copiar para o clipboard do sistema' })
vim.keymap.set({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Colar do clipboard do sistema' })
vim.keymap.set({ 'n', 'v' }, '<C-x>', '"+d', { desc = 'Recortar para o clipboard do sistema' })

-- Duplicar Linha/Seleção (Ctrl+D)
vim.keymap.set('n', '<C-d>', 'yyP', { desc = 'Duplicar linha' })
vim.keymap.set('v', '<C-d>', 'yP', { desc = 'Duplicar seleção' })

-- Desfazer (Ctrl+Z) e Refazer (Ctrl+R)
vim.keymap.set('n', '<C-z>', 'u', { desc = 'Desfazer' })
vim.keymap.set('i', '<C-z>', '<Esc>ui', { desc = 'Desfazer (modo inserção)' })
vim.keymap.set('n', '<C-r>', '<C-r>', { desc = 'Refazer' })
vim.keymap.set('i', '<C-r>', '<Esc><C-r>i', { desc = 'Refazer (modo inserção)' })

-- Deletar Linha/Seleção (Alt+D)
vim.keymap.set({ 'n', 'v' }, '<A-d>', 'd', { desc = 'Deletar linha/seleção' })
vim.keymap.set('i', '<A-d>', '<Esc>ddi', { desc = 'Deletar linha (modo inserção)' })

-- Explorador de Arquivos (NvimTree e Netrw)
vim.keymap.set('n', '<A-e>', ':NvimTreeToggle<CR>', { desc = 'Alternar NvimTree (Explorer 1)' })
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Abrir explorador padrão (Netrw)' }) -- Usa :Ex para o Netrw

-- Multi-cursor (Apenas placeholder, requer plugin específico como 'mg979/vim-visual-multi')
-- vim.keymap.set('n', '<C-S-Up>', '<Plug>(vim-visual-multi-cursor-next)', { desc = 'Multi-cursor: Próximo' })
-- vim.keymap.set('n', '<C-S-Down>', '<Plug>(vim-visual-multi-cursor-prev)', { desc = 'Multi-cursor: Anterior' })

-- Selecionar Tudo (Ctrl+A)
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Selecionar todo o conteúdo do arquivo' })

-- Pesquisar e Substituir (Ctrl+F para arquivo, Ctrl+G Ctrl+F para projeto)
-- Requer Telescope.nvim
vim.keymap.set('n', '<C-f>', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = 'Pesquisar no arquivo atual' })
vim.keymap.set('n', '<C-g><C-f>', function() require('telescope.builtin').live_grep() end, { desc = 'Pesquisar no projeto (Live Grep)' })

-- Busca de Arquivos (Ctrl+P para Telescope)
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Buscar arquivos (Telescope)' })

-- Opções de Temas (Placeholder, requer função ou plugin)
vim.keymap.set('n', '<C-k><C-t>', function() vim.notify("Funcionalidade de temas ainda não implementada.", vim.log.levels.INFO, { title = "Temas" }) end, { desc = 'Opções de Temas' })

-- Renomear Variável (F2) - Requer LSP
vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, { desc = 'LSP: Renomear Símbolo' })

-- Indentação (Ctrl+Setas Laterais)
vim.keymap.set({ 'n', 'v' }, '<C-Right>', '>>', { desc = 'Indentar para direita' })
vim.keymap.set({ 'n', 'v' }, '<C-Left>', '<<', { desc = 'Indentar para esquerda' })
vim.keymap.set('i', '<C-Right>', '<Esc>>>a', { desc = 'Indentar para direita (modo inserção)' })
vim.keymap.set('i', '<C-Left>', '<Esc><<a', { desc = 'Indentar para esquerda (modo inserção)' })

-- Alternar Terminal (Split Vertical Esquerdo)
vim.keymap.set('n', '<C-t>', ':vsplit | terminal<CR>', { desc = 'Alternar Terminal (Split Esquerdo)' })

-- Redimensionar Janelas (Shift+Setas)
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela' })
vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela' })

-- Mover Linhas (Ctrl+Setas Cima/Baixo)
vim.keymap.set('n', '<C-Down>', ':m .+1<CR>==', { desc = 'Mover linha/seleção para baixo' })
vim.keymap.set('n', '<C-Up>', ':m .-2<CR>==', { desc = 'Mover linha/seleção para cima' })
vim.keymap.set('i', '<C-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Mover linha para baixo (inserção)' })
vim.keymap.set('i', '<C-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Mover linha para cima (inserção)' })
vim.keymap.set('v', '<C-Down>', ":m '>+1<CR>gv=gv", { desc = 'Mover seleção para baixo' })
vim.keymap.set('v', '<C-Up>', ":m '<-2<CR>gv=gv", { desc = 'Mover seleção para cima' })

-- Início e Fim do Arquivo (Ctrl+Home/End)
vim.keymap.set('n', '<C-Home>', 'gg', { desc = 'Ir para o início do arquivo' })
vim.keymap.set('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })

-- Navegação entre Buffers (Ctrl+Tab, Ctrl+Shift+Tab)
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', { desc = 'Próximo Buffer' })
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', { desc = 'Buffer Anterior' })

-- Copiar Caminho do Arquivo (Ctrl+Alt+P)
vim.keymap.set('n', '<C-A-p>', function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg('+', file_path)
  vim.notify("Caminho do arquivo copiado!", vim.log.levels.INFO, { title = "Caminho Copiado" })
end, { desc = 'Copiar caminho completo do arquivo' })

-- Comentário em Linha/Bloco (Placeholders, requer plugin como 'nvim-comment')
-- vim.keymap.set({ 'n', 'v' }, '<leader>gc', '<Plug>(comment_toggle_linewise)', { desc = 'Comentar/Descomentar linha' })
-- vim.keymap.set({ 'n', 'v' }, '<leader>gb', '<Plug>(comment_toggle_blockwise)', { desc = 'Comentar/Descomentar bloco' })

-- Navegação entre Janelas (Ctrl+W Ctrl+W)
vim.keymap.set('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
