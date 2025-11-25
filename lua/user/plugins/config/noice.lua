-- @file: ~/.config/nvim/lua/user/plugins/config/noice.lua
-- @mission: Configura Noice.nvim para absorver mensagens de startup e depreciação.

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        -- ... (outras configurações, cmdline, presets) ...

        messages = {
          view_notify = "notify",
          view_history = "messages",
          enabled = true,
          -- Adicione ou modifique isto para controlar o que é exibido no startup
          presets = {
              -- Tenta esconder mensagens do tipo 'warning' no startup
              hidden = { level = "WARN", throttle = 50 }, 
          },
        },
        
        -- Garante que o Neovim use o Noice para todas as notificações
        throttle = 50, -- Reduz o tempo de exibição de mensagens rápidas
      })
      vim.notify = require("noice").notify 
    end,
    -- ...
  },
}