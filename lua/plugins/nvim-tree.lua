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
      side = "right", -- opcoes_posicao: left , right
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
      -- O erro estava aqui. A opção correta é 'exclude'.
      exclude = {
        "node_modules",
        -- Adicione extensões aqui se precisar, como 'out', 'bak', etc.
        -- Exemplo: "*.out", "*.bak"
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
    { "a", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar arquivo" },
    { "d", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar pasta" },
    { "r", "<cmd>NvimTreeRename<cr>", mode = { "n", "v" }, desc = "Renomear" },
    { "x", "<cmd>NvimTreeDelete<cr>", mode = { "n", "v" }, desc = "Deletar" },
  },
}