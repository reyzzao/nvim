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
      "<A-r>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "right",
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
          position = "right",
          source = "filesystem",
          dir = vim.fn.expand('%:p:h')
        })
      end,
      desc = "NeoTree: Navegar no projeto",
    },
  },
  opts = {
    window = {
      position = "right",
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_git_ignored = false,
        hide_hidden = false,
      },
      follow_current_file = {
        enabled = true,
        open_tree = true,
      },
      group_empty_dirs = false,
    },
    renderer = {
      icons = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
      tree_lines = {
        with_indents = true,
        ordering = "top_down",
        fold_level = false,
      },
    },
  },
  config = function()
    require("neo-tree").setup({})

    vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
      group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
      callback = function()
        local is_file = vim.api.nvim_get_option_value("buftype", { scope = "local" }) == ""
        if is_file then
          require("neo-tree.command").execute({
            action = "toggle_focus",
            position = "right",
            source = "filesystem",
            dir = vim.fn.expand("%:p:h")
          })
        end
      end,
    })
  end,
}