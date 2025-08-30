-- @file: ~/.config/nvim/lua/plugins/neo-tree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Este comando e apenas para compatibilidade
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require("neo-tree").setup({
      -- Usa o diretorio do git como raiz do projeto
      -- e permite a navegacao para fora
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_git_ignored = false
        },
        follow_current_file = {
          enabled = true,
          open_tree = true
        }
      },
      git_status = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_git_ignored = false
        }
      },
      window = {
        position = "float",
      },
      on_attach = function(bufnr)
        local api = require('neo-tree.api')

        vim.keymap.del('n', '..', { buffer = bufnr })
        vim.keymap.set('n', '..', function()
          api.node.navigate.parent_close()
        end, {
          desc = "Subir um nivel no diretorio",
          buffer = bufnr
        })
      end,
    })

    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Alternar Neo-tree' })
    vim.keymap.set('n', '<leader>ne', ':Neotree float<CR>', { desc = 'Alternar Neo-tree Flutuante' })
  end,
}