-- @file: ~/.config/nvim/lua/config/keymaps.lua

require('custom.GlobalRename')

local map = vim.keymap.set
local log_info = vim.log.levels.INFO
local notify = vim.notify

-- Importa as funções auxiliares
local keymaps_helpers = require('utils.keymaps_helpers')

-- FUNÇÕES AUXILIARES

--- Mapeamentos ESSENCIAIS
map({ 'n', 'i' }, '<C-s>', function()
    vim.api.nvim_command('w')
    local success, result = pcall(vim.lsp.buf.format)
    if success and result then
        notify("Arquivo salvo e formatado!", log_info, { title = "Salvar" })
    else
        notify("Arquivo salvo! Formatação falhou.", log_info, { title = "Salvar" })
    end
end, { desc = 'Salvar arquivo e formatar' })

--- Mapeamentos GERAIS

-- Maps IA Gemini
map({ 'n' }, '<leader>pG', ':GeminiPrompt<CR>', { desc = 'Prompt Gemini' })
map({ 'v' }, '<leader>pg', ':GeminiCode<CR>', { desc = 'Gerar com Codigo' })

--- Prefixo: leader + p
map('n', '<M-e>', ':Ex<CR>', { desc = 'Explorer do Vim >> Netwr' }) -- obs: function toogle nao funciona- problemas nativos.
    -- map('n', '<Esc>e', '<Cmd>lua toggle_netrw()<CR>', { desc = 'Alternar Explorer do Vim >> Netwr' }) -- Mapeamento para funcionar em terminais que não suportam <A-e> nativamente
-- map('n', '<C-e>', '<Cmd>lua toggle_netrw()<CR>', { desc = 'Alternar Explorer do Vim >> Netwr' })
map('n', '<leader>ph', ':InsertHeader<CR>', { desc = 'Insere endereço relativo do arquivo.' })
map('n', '<leader>pm', ':messages<CR>', { desc = 'Mostra mensagens' })

map('n', '<A-t>', keymaps_helpers.toggle_vsplit_terminal, { desc = 'Alternar Terminal em Vsplit' })
-- map('n', '<C-Click>', ':normal! gf<CR>', { noremap = true, silent = true, desc = 'tão Esquerdo do Mouse >> Abre erro clicavel no Terminal em novo buffer' })
map('n', '<leader>ps', ':%s///gc<Left><Left><Left>', { desc = 'Substituir texto (Confirmar)' })
map('n', '<leader>ptb', ':Telescope buffers', { desc = 'Mostra buffers recentes via telescope.' })
map('n', '<leader>n', ':GlobalRename', { desc = 'Global Rename / Replace in texts global by confirmation' })
map("n", "<leader>prc", function()
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
    notify("Configuração recarregada!", log_info)
end, { desc = "Recarregar config do Neovim" })
map('n', '<leader>k', ':confirm q<CR>', { desc = 'Fechar Kill Neovim (com confirmação)' })
map('n', '<leader>q', function()
  require('persistence').save() -- Salva a sessao manualmente
  vim.cmd('qa!') -- Forca a saida depois
end, { desc = 'Fechar o Neovim e salvar sessao com :qa!' })

--- Mapeamentos de COPIAR/RECORTAR/COLAR
map('n', '<leader>pc', function()
    local file_path = vim.fn.expand("%:p")
    vim.fn.setreg('+', file_path)
    notify("Caminho do arquivo copiado!", log_info, { title = "Caminho Copiado" })
end, { desc = 'Copiar caminho completo do arquivo' })
map({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copiar para o clipboard do sistema' })
map({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Colar do clipboard do sistema' })
map({ 'n', 'v' }, '<C-x>', '"+d', { desc = 'Recortar para o clipboard do sistema' })

--- Mapeamentos de MOVIMENTAÇÃO
map('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Mover linha para baixo' })
map('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Mover linha para cima' })
map('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Mover seleção para baixo' })
map('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Mover seleção para cima' })
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Mover linha para baixo (inserção)' })
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Mover linha para cima (inserção)' })
map('n', '<C-Home>', 'gg', { desc = 'Ir para o início do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })
map('n', '<C-Right>', keymaps_helpers.smart_navigation, { desc = 'Nav: Próximo Buffer/Tab inteligente > vai a direita' })
map('n', '<C-Left>', keymaps_helpers.smart_navigation_prev, { desc = 'Nav: Buffer/Tab anterior inteligente > vai a esquerda' })
-- map('n', '<C-j>', keymaps_helpers.smart_navigation, { desc = 'Nav: Próximo Buffer/Tab inteligente' })
-- map('n', '<C-k>', keymaps_helpers.smart_navigation_prev, { desc = 'Nav: Buffer/Tab anterior inteligente' })
map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-q>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-w>', ':qa<CR>', { desc = 'Fechar todos os buffers/janelas' })
    map('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
map('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
map('n', '<C-S-Left>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela' })
map('n', '<C-S-Right>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela' })

--- Mapeamentos de EDIÇÃO
map('n', '<C-z>', 'u', { desc = 'Desfazer' })
map('i', '<C-z>', '<Esc>ui', { desc = 'Desfazer (modo inserção)' })
map('n', '<C-r>', '<C-r>', { desc = 'Refazer' })
map('i', '<C-r>', '<Esc><C-r>i', { desc = 'Refazer (modo inserção)' })
map('n', '<C-a>', 'ggVG', { desc = 'Selecionar todo o conteúdo do arquivo' })
map('n', '<A-l>', 'V', { desc = 'Selecionar linha atual (Modo Normal)' })
map('i', '<A-l>', '<Esc>V', { desc = 'Selecionar linha atual (Modo Inserção)' })
map({ 'n', 'v' }, '<A-Right>', '>>', { desc = 'Indentar para direita' })
map({ 'n', 'v' }, '<A-Left>', '<<', { desc = 'Indentar para esquerda' })
map('i', '<C-Right>', '<Esc>>>a', { desc = 'Indentar para direita (modo inserção)' })
map('i', '<C-Left>', '<Esc><<a', { desc = 'Indentar para esquerda (modo inserção)' })
map('n', '<C-Down>', 'yyP', { desc = 'Duplicar linha' })
map('v', '<C-Down>', 'yP', { desc = 'Duplicar seleção' })
map({ 'n', 'v' }, '<C-Down>', 'yP', { desc = 'Duplicar linha/seleção' })

--- Mapeamentos de FERRAMENTAS/EXPLORADORES
map('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Buscar arquivos (Telescope)' })
map('n', '<C-f>', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = 'Pesquisar no arquivo atual' })
map('n', '<C-g><C-f>', function() require('telescope.builtin').live_grep() end, { desc = 'Pesquisar no projeto (Live Grep)' })