-- @file: lua/plugins/conform.lua

--- @mission: Configura o plugin conform.nvim para formatação automática.
--- @args: Não há argumentos.

return {
  "stevearc/conform.nvim",
  config = function()
    -- @mission: Configura as opções do conform.nvim e define os formatadores.
    -- @args: Não há argumentos.
    local conform = require("conform")

    conform.setup({
      -- Habilita a formatação ao salvar. Isso é o que resolve o seu problema.
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      -- Define os formatadores que serão usados para cada linguagem.
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        sh = { "shfmt" },
        html = { "prettier" },
      },
    })
  end,
}
