-- @file: ~/.config/nvim/lua/plugins/tokyonight.lua
-- @mission: Instala e configura o tema Tokyo Night com o sabor Night.

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm", -- sabores_disponiveis: [ night , day, moon, storm ]
  },
  config = function(_, opts)
    vim.cmd.colorscheme "tokyonight" -- #define o tema/colorscheme em uso
    require("tokyonight").setup(opts)

    -- Define a cor de fundo personalizada.
    -- Esta cor será aplicada *depois* que o colorscheme Dracula for carregado.
    local custom_background_hex = "#0d1017" -- #todo: #editable - aqui muda a cor de fundo deste tema
    -- local custom_background_hex = "#a6054b" -- Cor rosa de fundo para test - descomente apra testar e comente a de cima.
    -- cores_dark: [#010206, #0d1017]
    -- Aplica a cor de fundo personalizada para os grupos de destaque relevantes.
    -- Isso sobrescreve as configurações de fundo do tema.
    vim.cmd("highlight Normal guibg=" .. custom_background_hex)
    vim.cmd("highlight NormalFloat guibg=" .. custom_background_hex)
    vim.cmd("highlight EndOfBuffer guibg=" .. custom_background_hex)
    vim.cmd("highlight LineNr guibg=" .. custom_background_hex)
    vim.cmd("highlight FoldColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight SignColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight CursorLine guibg=" .. custom_background_hex)
    vim.cmd("highlight CursorLineNr guibg=" .. custom_background_hex)
    vim.cmd("highlight ColorColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight Conceal guibg=" .. custom_background_hex)
    vim.cmd("highlight Pmenu guibg=" .. custom_background_hex)
    vim.cmd("highlight PmenuSel guibg=" .. custom_background_hex)
    vim.cmd("highlight VertSplit guibg=" .. custom_background_hex)
    vim.cmd("highlight StatusLine guibg=" .. custom_background_hex)
    vim.cmd("highlight StatusLineNC guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLine guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLineFill guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLineSel guibg=" .. custom_background_hex)

  end,
}