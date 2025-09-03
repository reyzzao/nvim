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
-- map('n', '<leader>ps', ':%s///gc<Left><Left><Left>', { desc = 'Substituir texto (Confirmar)' })

map('n', '<leader>R', ':GlobalRename', { desc = 'Global Rename / Replace in texts global by confirmation' })

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

-- formata o arquivo ao salvar - removendo consoles e depuracoes de acordo com a regra do linter
local log_info = vim.log.levels.INFO
local notify = vim.notify

map({ 'n', 'i' }, '<C-s>', function()
    vim.api.nvim_command('w')
    notify("Arquivo salvo!", log_info, { title = "Salvar" })
end, { desc = 'Salvar arquivo' })

map({ "n", "v" }, "<leader>f", function()
    vim.lsp.buf.format()
    notify("Arquivo formatado!", log_info, { title = "Formatar" })
end, { desc = "Formatar arquivo" })


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

-- Mapeamentos de teclas para LSP
map('n', '<leader>li', vim.lsp.buf.hover, { desc = 'Recurso: LSP Hover >> mostra info de artefatos ao passar mouse., atalho:li de : Lsp info' })

map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format Code' })


--- Alterna entre buffers e tabs de forma inteligente.
local function smart_navigation()
    -- Altera para o proximo buffer ou tab.
    if #vim.fn.gettabinfo() > 1 then
        vim.api.nvim_command('tabnext')
    else
        vim.api.nvim_command('bnext')
    end
end

--- Alterna entre buffers e tabs de forma inteligente (anterior).
local function smart_navigation_prev()
    -- Altera para o buffer ou tab anterior.
    if #vim.fn.gettabinfo() > 1 then
        vim.api.nvim_command('tabprevious')
    else
        vim.api.nvim_command('bprevious')
    end
end

--- Alterna um terminal em um split vertical (vsplit).
local function toggle_vsplit_terminal()
  -- Procura o ID do buffer de um terminal aberto.
  local function find_terminal_buffer()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == 'terminal' then
        return buf
      end
    end
    return nil
  end

  local terminal_buf = find_terminal_buffer()
  
  if terminal_buf then
    -- Se o buffer do terminal ja existe, esconda-o.
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end

  -- Se o buffer do terminal nao existe ou nao esta visivel, crie um novo.
  vim.cmd('vsplit')
  vim.cmd('cd %:p:h')
  vim.cmd('terminal')
  vim.cmd('startinsert')
  terminal_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_keymap(terminal_buf, 'n', '<C-c>', ':q!<CR>', { noremap = true })
  vim.api.nvim_buf_set_option(terminal_buf, 'buflisted', true)
end

-- Maps de Terminal
map('n', '<A-t>',toggle_vsplit_terminal, { desc = 'Alternar Terminal em Vsplit' })

--- Maps Movimentação  -- Lefth Rigth

-- funciona identacao no modo vim : no modo normal:  shift << ou >> 
-- todo: esses nao funcionando apra identar
-- map('i', '<A-Lefth>', '<<', { noremap = true, silent = true, desc = 'identacao' })
-- map('i', '<A-Rigth>', '>>', { noremap = true, silent = true, desc = 'identacao' })
-- map('n', '<A-Lefth>', '<<', { noremap = true, silent = true, desc = 'identacao' })
-- map('n', '<A-Rigth>', '>>', { noremap = true, silent = true, desc = 'identacao' })
-- map('v', '<A-Lefth>', '<<', { noremap = true, silent = true, desc = 'identacao' })
-- map('v', '<A-Rigth>', '>>', { noremap = true, silent = true, desc = 'identacao' })

map('n', '<A-k>', ':m .+1<CR>==', { desc = 'Mover linha para baixo' })
map('n', '<A-j>', ':m .-2<CR>==', { desc = 'Mover linha para cima' })
map('v', '<A-k>', ":m '>+1<CR>gv=gv", { desc = 'Mover selecao para baixo' })
map('v', '<A-j>', ":m '<-2<CR>gv=gv", { desc = 'Mover selecao para cima' })
map('i', '<A-k>', '<Esc>:m .+1<CR>==gi', { desc = 'Mover linha para baixo (insercao)' })
map('i', '<A-j>', '<Esc>:m .-2<CR>==gi', { desc = 'Mover linha para cima (insercao)' })

map('n', '<C-Home>', 'gg', { desc = 'Ir para o inicio do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })

map('n', '<C-Tab>', smart_navigation, { desc = 'Nav: Proximo Buffer/Tab inteligente > vai a direita' })
map('n', '<S-Tab>', smart_navigation_prev, { desc = 'Nav: Buffer/Tab anterior inteligente > vai a esquerda' })

map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-q>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-w>', ':qa<CR>', { desc = 'Fechar todos os buffers/janelas' })

map('n', '<A-S-k>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
map('n', '<A-S-j>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
map('n', '<A-S-l>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela - direcao mao direita' })
map('n', '<A-S-h>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela - direcao mao esquerda' }) 



-- Maps IA Gemini
map({ 'n' }, '<leader>pG', ':GeminiPrompt<CR>', { desc = 'Prompt Gemini' })
map({ 'v' }, '<leader>pg', ':GeminiCode<CR>', { desc = 'Gerar com Codigo' })
