-- @file: ~/.config/nvim/lua/plugins/neo-tree.lua
-- @mission: explorer files flutuant

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
    {
      "<leader>eg",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          dir = vim.fn.expand("~")
        })
      end,
      desc = "NeoTree: Navegar na pasta Home",
    },
  },
  opts = {
    window = {
      position = "float",
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_git_ignored = false,
      },
      follow_current_file = {
        enabled = true,
        open_tree = true,
      },
    },
    git_status = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_git_ignored = false,
      },
    },
    on_attach = function(bufnr)
      local keymaps = {
        ["<CR>"] = "open",
        ["l"] = "open",
        [".."] = "navigate_up",
        ["h"] = "navigate_up",
        ["a"] = { "create", "file" },
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["p"] = "paste",
        ["?"] = "show_help",
        ["x"] = "cut_to_clipboard",
        ["<C-h>"] = "clear_clipboard",
        ["<C-q>"] = "toggle_hidden",
        ["t"] = "toggle_tag",
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
        ["<space>"] = "toggle_preview",
      }
      local api = require('neo-tree.api')
      for key, action in pairs(keymaps) do
        vim.keymap.set('n', key, action, {
          desc = 'neo-tree: ' .. tostring(action),
          buffer = bufnr
        })
      end
    end,
  },
}