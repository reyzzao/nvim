-- @file: ~/.config/nvim/lua/config/diagnostics.lua
-- @mission: Configura a exibicao global de diagnosticos (erros e avisos).

-- Configura a exibicao de diagnosticos como texto virtual e janelas flutuantes
vim.diagnostic.config({
  virtual_text = {
    source = "always",
    severity = { min = vim.diagnostic.severity.HINT },
    format = function(diag)
      return string.format("[%s] %s", diag.source or "LSP", diag.message)
    end,
  },
  float = true,
})