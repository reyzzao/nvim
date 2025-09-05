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
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Encontrar arquivos" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Busca por string" },
    { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Pesquisar no arquivo atual" },
    { "<C-g><C-f>", "<cmd>Telescope live_grep<cr>", desc = "Pesquisar no projeto (Live Grep)" },
    { "<leader>R", function()
      local word = vim.fn.expand("<cword>")
      if word ~= nil and word ~= "" then
        require("telescope.builtin").live_grep({
          search_terms = { word },
        })
      else
        require("telescope.builtin").live_grep()
      end
    end, desc = "Busca para substituição global" },
  },
}