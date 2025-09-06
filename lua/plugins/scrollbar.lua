-- @file: ~/.config/nvim/lua/plugins/scrollbar.lua
-- @mission: Instala e configura uma barra de rolagem visual no Neovim, com opções de personalização de cor e tamanho.

return {
  "petertriho/nvim-scrollbar",
  opts = {
    show = true,
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "lazy",
      "mason",
      "gitcommit",
      "netrw",
    },
    ignore_buffers = {
      "gitcommit",
      "lazy",
      "help",
    },
    marks = {
      DiagnosticError = { "E" },
      DiagnosticWarn = { "W" },
      DiagnosticInfo = { "I" },
    },
    width = 2, -- Define a largura da barra.
  },
  config = function(_, opts)
    require("scrollbar").setup(opts)

    -- Define a cor da barra de rolagem e do marcador.
    -- O 'bg' (background) é o fundo da barra e o 'fg' (foreground) é a cor do marcador (thumb).
    -- A cor #282a36 é um preto mais profundo que pode dar a sensação de largura.
    vim.api.nvim_set_hl(0, 'Scrollbar', { bg = '#282a36' })

    -- Define a cor e o caractere do marcador.
    -- O caractere '█' é um bloco sólido que dá a sensação de ser "gordinho".
    vim.api.nvim_set_hl(0, 'ScrollbarThumb', { bg = '#D8DEE9', fg = 'white', blend = 0 })
  end,
}