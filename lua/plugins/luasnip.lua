-- @file: ~/.config/nvim/lua/plugins/luasnip.lua

return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    
    -- Comando para recarregar os snippets
    vim.api.nvim_create_user_command("LSReload", function()
      require("luasnip.loaders.from_vscode").lazy_load()
      vim.notify("Snippets recarregados!", vim.log.levels.INFO)
    end, { desc = "Recarrega todos os snippets do LuaSnip" })
  end,
  keys = {
    {
      "<C-j>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "i",
      desc = "Pular para proximo placeholder",
    },
    {
      "<C-k>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = "i",
      desc = "Pular para placeholder anterior",
    },
    {
      "<leader>pn",
      function()
        require("luasnip").expand()
      end,
      mode = { "i", "s" },
      desc = "Expandir snippet",
    },
  },
}