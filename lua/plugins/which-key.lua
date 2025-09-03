-- @file: ~/.config/nvim/lua/plugins/which-key.lua
-- @mission: define o menu de ajuda com os atalhos definidos ao pressionar leader.

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      -- Desativa o mapeamento padrão que o lazyvim define para o which-key
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- Define o atalho líder para o qual o menu será exibido
      -- O LazyVim ja faz isso, mas aqui reforçamos
      -- Este é o menu que você verá
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
      -- A partir daqui, você pode registrar seus próprios atalhos
      -- Para um menu em branco, não adicione nada.
    end,
  },
}

--[[ 
Para funcionar no keymaps teria que inserir a funcao acima o keymaps ficaria assim:

-- @file: ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local which_key = require("which-key")

-- Menu de atalhos personalizados
local opts = {
  mode = "n", -- modo normal
  prefix = "<leader>",
  buffer = nil, -- Buffer local
  silent = true,
  noremap = true,
  nowait = false,
}

local mappings = {
  e = {
    name = "Explorador",
    n = { ":NvimTreeToggle<CR>", "Alternar Nvim-Tree" },
    x = { ":Lexplore<CR>", "Alternar Netrw" },
  },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<CR>", "Alternar Terminal" },
  },
}

which_key.register(mappings, opts)

-- Mapeamentos de atalhos diretos que não aparecem no menu
-- Exemplo:
-- map('n', '<leader>en', ':NvimTreeToggle<CR>', { desc = 'Alternar Nvim-Tree (Direita)' })

 ]]