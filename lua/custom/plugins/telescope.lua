-- ~/.config/nvim/lua/custom/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0', -- CORRIGIDO: Usar a tag 0.1.0
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope.builtin')
    local actions = require('telescope.actions')

    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Buffer (Telescope)' })

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<CR>"] = actions.select_default,
          },
          n = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<CR>"] = actions.select_default,
          },
        },
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
        },
        sorting_strategy = "ascending",
        selection_strategy = "reset",
        file_ignore_patterns = { "node_modules", "%.git" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {},
      },
      extensions = {},
    }
  end,
}
