-- @file: ~/.config/nvim/lua/plugins/telescope.lua
-- @package: plugins.telescope

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
          },
        },
      },
    })

    local keymap = vim.keymap.set

    -- Encontra arquivos em todo o projeto
    keymap("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })

    -- Busca por strings em todo o projeto
    keymap("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })
  end,
}
