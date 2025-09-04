-- @file: ~/.config/nvim/lua/plugins/telescope.lua
-- @mission: Mantém a configuração do Telescope no formato mais simples e compatível com o LazyVim.
-- Depende de `nvim-lua/plenary.nvim`.

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
  },
}