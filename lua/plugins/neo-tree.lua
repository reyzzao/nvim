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

        local keymaps = {
          ["<CR>"] = "open", -- desc: Abrir o arquivo ou entrar no diretorio
          ["l"] = "open", -- desc: Entrar no diretorio
          [".."] = "navigate_up", -- desc: Subir um nivel de diretorio
          ["h"] = "navigate_up",
          ["<S-Down>"] = "move_down", -- desc: Mover para baixo
          ["<S-Up>"] = "move_up", -- desc: Mover para cima
          ["a"] = { "create", "file" }, -- desc: Criar um novo arquivo ou diretorio
          ["d"] = "delete", -- desc: Deletar o arquivo ou diretorio selecionado
          ["r"] = "rename", -- desc: Renomear o arquivo ou diretorio
          ["y"] = "copy_to_clipboard", -- desc: Copiar o arquivo ou diretorio
          ["p"] = "paste", -- desc: Colar
          ["?"] = "show_help", -- desc: Mostrar ajuda
          ["x"] = "cut_to_clipboard", -- desc: Recortar
          ["<C-h>"] = "clear_clipboard", -- desc: Limpa o clipboard
          ["<C-q>"] = "toggle_hidden", -- desc: Alterna a visibilidade de arquivos ocultos
          ["t"] = "toggle_tag", -- desc: Selecionar/marcar um item para acao em massa
          ["v"] = "open_vsplit", -- desc: Abrir arquivo em split vertical
          ["s"] = "open_split", -- desc: Abrir arquivo em split horizontal
          ["<space>"] = "toggle_preview", -- desc: Pre-visualizar arquivo
          
          -- Atalhos de undo e redo
          ["u"] = "undo", -- desc: Desfazer a ultima operacao
          ["<C-r>"] = "redo", -- desc: Refazer a ultima operacao
        }

        for key, action in pairs(keymaps) do
          vim.keymap.set('n', key, action, {
            desc = 'neo-tree: ' .. (keymaps[key].desc or tostring(action)),
            buffer = bufnr
          })
        end
      end,
    })

    -- Mapeamentos globais para alternar a janela
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Alternar Neo-tree' })
    vim.keymap.set('n', '<leader>ne', ':Neotree float<CR>', { desc = 'Alternar Neo-tree Flutuante' })
  end,
}