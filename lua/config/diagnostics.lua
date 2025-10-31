-- @file: ~/.config/nvim/lua/config/diagnostics.lua
-- @mission: Configura a exibicao global de diagnosticos (erros e avisos), destaques e mapeamentos.

local M = {}

--- Configura a exibicao de diagnosticos (virtual_text, float, signs)
M.setup_diagnostics = function()
  vim.diagnostic.config({
    -- Habilita o texto virtual na linha para mostrar a mensagem de erro
    virtual_text = {
      source = "always", -- Sempre mostra o texto virtual
      severity = { min = vim.diagnostic.severity.ERROR }, -- Mostra virtual_text apenas para ERROS
      format = function(diag)
        -- Exemplo: "[LSP] Mensagem do erro"
        return string.format("  [%s] %s", diag.source or "LSP", diag.message)
      end,
      spacing = 1, -- Espaçamento
    },
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

--- Configura os destaques visuais para ERROS (vermelho)
M.setup_highlights = function()
  -- Cores sugeridas (você pode ajustar os valores hexadecimais)
  local error_sign_bg = "#460000"
  local error_sign_fg = "#FF3030"
  local error_line_bg = "#1A0000" -- Cor de fundo para a linha
  local error_underline_sp = "#FF3030"

  -- 1. Destaque para o ÍCONE de erro na coluna de sinais
  vim.api.nvim_set_hl(0, "DiagnosticSignError", {
    bg = error_sign_bg,
    fg = error_sign_fg,
    bold = true
  })

  -- 2. Destaque para a LINHA inteira onde o erro ocorre
  vim.api.nvim_set_hl(0, "DiagnosticLineError", {
    bg = error_line_bg,
  })

  -- 3. Destaque para o TEXTO sublinhado do erro
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
    undercurl = true,
    sp = error_underline_sp,
  })

  -- 4. Destaque para o TEXTO VIRTUAL (a mensagem de erro na linha)
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
    fg = error_underline_sp,
    italic = true,
  })
end

--- Configurações para Warnings (Amarelo)
M.setup_warning_highlights = function()
  local warn_sign_bg = "#463900"
  local warn_sign_fg = "#FFCC00"
  local warn_line_bg = "#1A1500"
  local warn_underline_sp = "#FFCC00"

  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {
    bg = warn_sign_bg,
    fg = warn_sign_fg,
    bold = true
  })
  vim.api.nvim_set_hl(0, "DiagnosticLineWarn", {
    bg = warn_line_bg,
  })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
    undercurl = true,
    sp = warn_underline_sp,
  })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
    fg = warn_underline_sp,
    italic = true,
  })
end

--- Configura os mapeamentos de teclado para diagnósticos e ações LSP
M.setup_keymaps = function()
  -- Diagnostico de erros
  -- @mission: Mapeamentos globais para diagnósticos e ações LSP.

  -- DIAGNOSTICOS E CORREÇÕES (Prefixado com <leader>pd)
  -- @mission: Mapeamentos globais para diagnósticos e ações LSP.
  vim.keymap.set('n', '<leader>pde', vim.diagnostic.open_float, { desc = 'LSP: Show diagnostic float' })
  vim.keymap.set('n', '<leader>pdl', vim.diagnostic.setloclist, { desc = 'LSP: Diagnostics List (loclist)' })
  vim.keymap.set('n', '<leader>pdn', vim.diagnostic.goto_next, { desc = 'LSP: Next Diagnostic' })
  vim.keymap.set('n', '<leader>pdp', vim.diagnostic.goto_prev, { desc = 'LSP: Previous Diagnostic' })
  vim.keymap.set('n', '<leader>pca', vim.lsp.buf.code_action, { desc = 'LSP: Code Action (Correcao)' })
  vim.keymap.set('n', '<leader>pdz', vim.lsp.buf.code_action, { desc = 'LSP: Sugestão corrigir erro' })
  -- FIM: Diagnostico erros
end

-- Executa todas as configurações ao carregar o arquivo
M.setup_diagnostics()
M.setup_highlights()
M.setup_warning_highlights()
M.setup_keymaps() -- NOVO: Chama os mapeamentos de teclado

return M