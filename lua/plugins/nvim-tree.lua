-- @file: ~/.config/nvim/lua/plugins/nvim-tree.lua
-- @todo: só tem comportamento estranho para explorar na /home > funciona mas fecha o explorer e muda de lado.
-- @status: este nvim-tree sera o default no lugar do snacks, estou usando de preferencia o neo-tree , mas a leader>e tem que ter um default no lugar do snacks deixo este.

local function update_dotfiles()
  print("update_dotfiles chamada")
  vim.g.nvim_tree_toggle_dotfiles = not vim.g.nvim_tree_toggle_dotfiles
  require("nvim-tree").setup({ filters = { dotfiles = vim.g.nvim_tree_toggle_dotfiles } })
  require("nvim-tree.api").tree.reload()
  vim.cmd("NvimTreeRefresh")
end

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
      side = "right",
      width = "30%",
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
      dotfiles = vim.g.nvim_tree_toggle_dotfiles,
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
    { "<A-e>", "<cmd>NvimTreeToggle<cr>", desc = "Alternar Explorer (NvimTree)" },
    { "<leader>h", function()
      update_dotfiles()
    end, desc = "Alternar arquivos ocultos" },
    { "<leader>a", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar arquivo" },
    { "<leader>d", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar pasta" },
    { "<leader>r", "<cmd>NvimTreeRename<cr>", mode = { "n", "v" }, desc = "Renomear" },
    { "<leader>x", "<cmd>NvimTreeDelete<cr>", mode = { "n", "v" }, desc = "Deletar" },
  },
  config = function(_, opts)
    vim.g.nvim_tree_toggle_dotfiles = opts.filters.dotfiles
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
