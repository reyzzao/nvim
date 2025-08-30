-- @file: ~/.config/nvim/lua/keymaps/editor_maps.lua

-- Funcoes de ajuda para Mapeamentos

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


-- Mapeamentos de teclas
local map = vim.keymap.set

-- Maps de Terminal
map('n', '<A-t>',toggle_vsplit_terminal, { desc = 'Alternar Terminal em Vsplit' })

--- Maps Movimentação
map('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Mover linha para baixo' })
map('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Mover linha para cima' })
map('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Mover selecao para baixo' })
map('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Mover selecao para cima' })
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { desc = 'Mover linha para baixo (insercao)' })
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { desc = 'Mover linha para cima (insercao)' })
map('n', '<C-Home>', 'gg', { desc = 'Ir para o inicio do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })
map('n', '<C-Right>', smart_navigation, { desc = 'Nav: Proximo Buffer/Tab inteligente > vai a direita' })
map('n', '<C-Left>', smart_navigation_prev, { desc = 'Nav: Buffer/Tab anterior inteligente > vai a esquerda' })
map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-q>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-w>', ':qa<CR>', { desc = 'Fechar todos os buffers/janelas' })
map('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
map('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
map('n', '<C-S-Left>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela' })
map('n', '<C-S-Right>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela' })