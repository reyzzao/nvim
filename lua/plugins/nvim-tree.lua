-- @file: ~/.config/nvim/lua/plugins/nvim-tree.lua
-- @mission: Configura o plugin nvim-tree, garantindo que o explorador de arquivos comece aberto, as pastas sejam expandidas e a navegação seja mantida.

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      -- Largura do navegador de arquivos
      width = 40,
      side = "right", -- lado do explorer, opcoes: [ right, left ]
    },
    renderer = {
      -- Exibe ícones para os arquivos
      icons = {
        -- A opção 'show_only_dirs' foi removida, então a linha abaixo foi excluída.
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
        quit_on_open = false, -- NÃO fecha o nvim-tree quando um arquivo é aberto
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

    -- Mapeamentos de atalhos para controlar o nvim-tree
    vim.keymap.set("n", "<A-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Alternar NvimTree" })
    vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Mostrar arquivo atual" })

    -- Comando para garantir que o nvim-tree abra automaticamente e expanda o diretório
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeOpen", { clear = true }),
      callback = function()
        -- Abre a árvore se não houver argumentos (ou seja, não abriu um arquivo específico)
        local has_args = #vim.fn.argv() > 0
        if not has_args then
          vim.cmd("NvimTreeOpen")
          vim.cmd("NvimTreeToggle") -- Fecha a janela atual para reabrir
          vim.cmd("NvimTreeOpen")   -- Abre a janela novamente
        end
      end,
    })
  end,
}