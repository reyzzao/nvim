-- @file: ~/.config/nvim/lua/plugins/neo-tree.lua
-- @mission: Explorer de arquivos flutuante com atalhos e posicoes personalizadas, garantindo a exibicao correta dos diretorios.

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ex",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          dir = vim.fn.expand("~")
        })
      end,
      desc = "NeoTree: Navegar fora do projeto",
    },
    {
      "<A-e>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          dir = vim.fn.expand('%:p:h')
        })
      end,
      desc = "NeoTree: Navegar no projeto",
    },
  },
  opts = {
    window = {
      position = "right", -- [ "float", "right"]
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
        open_tree = true,
      },
    },
    renderer = {
      icons = {
        -- Usa ícones padrão de pastas
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
      -- Habilita as linhas da árvore para exibir a hierarquia
      tree_lines = {
        with_indents = true,
      },
    },
  },
}