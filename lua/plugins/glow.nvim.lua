-- @file: ~/.config/nvim/lua/plugins/glow.nvim.lua

-- @mission: ativar o glow preview de arquivos markdown

return {
  "ellisonleao/glow.nvim",
  ft = "markdown",
  config = function()
    require("glow").setup({
      width = 100,
      split = "left", -- Define o preview para abrir em um split a direita , options: [ left, right, top, bottom ]
    })
  end,
  keys = {
    {
      "<leader>mg",
      "<cmd>Glow<cr>",
      desc = "Ativar o Glow Preview",
    },
  },
}