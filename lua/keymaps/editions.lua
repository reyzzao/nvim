-- @file: ~/.config/nvim/lua/config/keymaps.lua

require('custom.GlobalRename')

local map = vim.keymap.set
local log_info = vim.log.levels.INFO
local notify = vim.notify

--- Mapeamentos de EDIÇÃO


--- Prefixo: leader + p

map('n', '<leader>ph', ':InsertHeader<CR>', { desc = 'Insere endereço relativo do arquivo.' }) -- todo: parou
map('n', '<leader>pm', ':messages<CR>', { desc = 'Mostra mensagens' })

-- map('n', '<C-Click>', ':normal! gf<CR>', { noremap = true, silent = true, desc = 'tão Esquerdo do Mouse >> Abre erro clicavel no Terminal em novo buffer' })
map('n', '<leader>ps', ':%s///gc<Left><Left><Left>', { desc = 'Substituir texto (Confirmar)' })

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

map({ 'n', 'i' }, '<C-s>', function()
    vim.api.nvim_command('w')
    local success, result = pcall(vim.lsp.buf.format)
    if success and result then
        notify("Arquivo salvo e formatado!", log_info, { title = "Salvar" })
    else
        notify("Arquivo salvo! Formatação falhou.", log_info, { title = "Salvar" })
    end
end, { desc = 'Salvar arquivo e formatar' })


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

