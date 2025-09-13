-- @file: ~/.config/nvim/lua/plugins/gen.lua
-- @mission: Configura o plugin gen.nvim para usar a API do Gemini.
-- @dependencias: nvim-lua/plenary.nvim

return {
  "David-Kunz/gen.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    model = "gemini-pro",
    host = "api.gen.com",
    api_key = vim.env.GEMINI_API_KEY,
  },
  keys = {
    {
      "<A-i>",
      function()
        require("gen").prompt_buffer()
      end,
      mode = "n",
      desc = "Gen: Abrir prompt para AI",
    },
    {
      "<A-p>",
      function()
        require("gen").prompt_visual()
      end,
      mode = "v",
      desc = "Gen: Usar selecao como prompt",
    },
  },
}