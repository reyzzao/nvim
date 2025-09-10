-- @file: ~/.config/nvim/lua/plugins/nvim-tree.lua
-- @mission: Configura o nvim-tree para funcionar como o 'snacks_explorer', abrindo do lado direito e mantendo-se aberto após a seleção de arquivos, com atalhos personalizados.

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      -- Largura do navegador de arquivos
      width = 40,
      -- Lado em que o explorador de arquivos será exibido (direito, como você pediu)
      side = "right",
    },
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_open = "",
            arrow_closed = "",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    actions = {
      open_file = {
        -- NÃO fecha o nvim-tree quando um arquivo é aberto
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    -- Remove os mapeamentos de atalhos padrão do nvim-tree
    vim.keymap.del("n", "<leader>fe")
    vim.keymap.del("n", "<leader>fE")

    -- Define os novos mapeamentos de atalhos
    -- <leader>e: para navegação DENTRO do projeto (nvim-tree)
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Explorar no projeto (dentro do CWD)" })
    -- <leader>E: para navegação FORA do projeto (netrw)
    vim.keymap.set("n", "<leader>E", ":Ex<CR>", { noremap = true, silent = true, desc = "Explorar fora do projeto (netrw)" })
    -- <leader>f: Encontra o arquivo atual no explorador
    vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Mostrar arquivo atual" })
  end,
}