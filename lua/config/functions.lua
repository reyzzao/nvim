-- @file: ~/.config/nvim/lua/config/functions.lua
-- @mission: Contém funções auxiliares para o editor, incluindo manipulação de texto, terminal, e configurações LSP.

local log_info = vim.log.levels.INFO
local notify = vim.notify

local M = {}

--- Funções de EDIÇÃO

-- Função para alternar a caixa da palavra
function M.toggle_case()
  local current_word = vim.fn.expand("<cword>")
  if current_word == nil or current_word == "" then
    return
  end
  local first_char = current_word:sub(1, 1)
  local new_word
  if first_char == first_char:upper() then
    new_word = current_word:lower()
  else
    new_word = current_word:upper()
  end
  vim.api.nvim_command("normal! ciw" .. new_word)
end

-- Função para inserir um cabeçalho de arquivo
function M.InsertHeader()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  if #lines > 0 and lines[1]:match('^-- @file') then
    local end_of_header = 1
    while end_of_header <= #lines and (lines[end_of_header] == '' or lines[end_of_header]:match('^-- @')) do
      end_of_header = end_of_header + 1
    end
    vim.api.nvim_buf_set_lines(0, 0, end_of_header, false, {})
  end

  local header_content = {
    "-- @file: ",
    "-- @mission: ",
    "",
  }
  vim.api.nvim_buf_set_lines(0, 0, 0, false, header_content)
  vim.cmd("normal! 1G2l")
end

--- Funções de Utilitário

-- Função para alternar Terminal em Vsplit
function M.toggle_vsplit_terminal()
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
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end
  vim.cmd('vsplit')
  vim.cmd('cd %:p:h')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end

--- Configurações LSP

-- Função auxiliar para `on_attach` de clientes LSP.
function M.on_attach_default(client, bufnr)
  -- Mapeamento para ir para a definição de simbolo com o mouse
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LspMouseMaps', { clear = true }),
    callback = function(args)
      vim.keymap.set('n', '<LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = args.buf, desc = 'Ir para a definição (mouse)' })
    end,
  })

  -- NOVO: Autocmd para formatar ao salvar, agora dentro do escopo correto
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = true }),
    buffer = bufnr,
    callback = function()
      if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
        vim.lsp.buf.format({ async = true, buf = bufnr })
      end
    end,
    desc = 'Auto-format on save via LSP',
  })

  -- Configurações para lista de diagnósticos (erros/warnings)
  vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
      },
  })
end

return M