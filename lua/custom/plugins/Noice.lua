-- @file: ~/.config/nvim/lua/custom/plugins/Noice.lua
-- @mission: Configura o plugin 'noice.nvim' para uma barra de comando flutuante.

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      cmdline = { view = "cmdline", format = { cmdline = { ui = "default" } } },
      messages = { view_notify = "notify", view_history = "messages", enabled = true },
      presets = { bottom_search = true, command_palette = true, long_message_to_view = true },
    })
    -- CRUCIAL: Força o uso do Noice para notificações
    vim.notify = require("noice").notify 
  end,
  dependencies = { "MunifTanjim/nui.nvim" },
  -- Mapeamentos uteis para o Noice
  keys = {
    { "<leader>nd", "<cmd>Noice dismiss<CR>", desc = "Noice: Fechar notificacao/pop-up" },
    { "<leader>nh", "<cmd>Noice history<CR>", desc = "Noice: Mostrar historico" },
  },
}