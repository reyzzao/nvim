local M = {}

-- Navegação Inteligente (Buffers e Tabs)

--- @mission Alternar entre buffers e tabs de forma inteligente.
--- @args (Nenhum)
function M.smart_navigation()
    -- @mission: Altera para o próximo buffer ou tab.
    -- Se houver mais de um tab, navega entre tabs. Caso contrário, entre buffers.
    -- @args: Não há argumentos.
    if #vim.fn.gettabinfo() > 1 then
        vim.api.nvim_command('tabnext')
    else
        vim.api.nvim_command('bnext')
    end
end

--- @mission Alternar entre buffers e tabs de forma inteligente (anterior).
--- @args (Nenhum)
function M.smart_navigation_prev()
    -- @mission: Altera para o buffer ou tab anterior.
    -- Se houver mais de um tab, navega entre tabs. Caso contrário, entre buffers.
    -- @args: Não há argumentos.
    if #vim.fn.gettabinfo() > 1 then
        vim.api.nvim_command('tabprevious')
    else
        vim.api.nvim_command('bprevious')
    end
end

-- Funcionalidade do Terminal

--- @mission: Alterna um terminal em um split vertical. Se o terminal não existe, ele é criado.
--- Se existe, ele é alternado, seguindo a lógica de toggle.
--- @args: (Nenhum)
function M.toggle_vsplit_terminal()
  -- @mission: Alterna a visibilidade do terminal em vsplit.
  -- Se o terminal não existir, ele é criado. Se existir, ele é alternado.
  -- @args: Não há argumentos.
  local function find_terminal_buffer()
    -- @mission: Procura o ID do buffer de um terminal aberto.
    -- @args: Não há argumentos.
    -- @return: ID do buffer do terminal ou nil se não encontrado.
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
    -- Se o buffer do terminal já existe, esconda-o.
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end

  -- Se o buffer do terminal não existe ou não está visível, crie um novo.
  vim.cmd('vsplit')
  vim.cmd('cd %:p:h') -- mudar para o diretório do projeto
  vim.cmd('terminal')
  vim.cmd('startinsert')
  terminal_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_keymap(terminal_buf, 'n', '<C-c>', ':q!<CR>', { noremap = true }) -- fechar com Ctrl+C
  vim.api.nvim_buf_set_option(terminal_buf, 'buflisted', true) -- links de erro funcionam
end

return M