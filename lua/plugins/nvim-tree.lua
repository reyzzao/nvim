-- @mission: Configura o Nvim-Tree para abrir automaticamente na inicialização do Neovim, usando autocmds.
-- Mantém a configuração para o lado direito da tela.

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 40,
      side = "right", -- options: [ left, right, top, bottom ]
      float = {
        enable = false,
        open_win_config = {
          height = 0,
          width = 0,
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
      exclude = {
        "node_modules",
      },
      custom = {},
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Alternar Explorer (NvimTree)" },
    { "<leader>a", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar arquivo" },
    { "<leader>d", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar pasta" },
    { "<leader>r", "<cmd>NvimTreeRename<cr>", mode = { "n", "v" }, desc = "Renomear" },
    { "<leader>x", "<cmd>NvimTreeDelete<cr>", mode = { "n", "v" }, desc = "Deletar" },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      pattern = { "*" },
      callback = function()
        if vim.fn.argc() == 0 and not vim.api.nvim_get_option_value("buflisted", {}) then
          vim.cmd.NvimTreeOpen()
        end
      end,
    })
  end,
}