-- ~/.config/nvim/lua/custom/plugins/nvimtree.lua

-- Este arquivo define a configuração do plugin nvim-tree.lua para o lazy.nvim.

return {
  'nvim-tree/nvim-tree.lua',
  version = '*', -- Use a versão mais recente
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Ícones para os arquivos (dependência visual)
  },
  config = function()
    local nvimtree = require('nvim-tree')

    -- Configuração principal do nvim-tree
    nvimtree.setup({
      sort_by = "case_sensitive",
      view = {
        width = 30, -- Largura da árvore de arquivos
        relativenumber = true, -- Números relativos na árvore
      },
      renderer = {
        group_empty = true, -- Agrupa diretórios vazios
      },
      filters = {
        dotfiles = false, -- Mostrar arquivos ocultos (começam com .)
      },
      git = {
          ignore = false, -- Mostrar arquivos ignorados pelo Git
      },
      diagnostics = {
          enable = true, -- Mostrar diagnósticos (erros/warnings) nos arquivos
      },
      actions = {
          open_file = {
              quit_on_open = true,
          },
      },
      -- Mapeamentos de teclas específicos do nvim-tree quando ele está ativo.
      -- A função on_attach é chamada quando o buffer do nvim-tree é criado.
      on_attach = function(bufnr)
          -- Adicionando vim.schedule para garantir que a API esteja pronta
          vim.schedule(function()
              local api = require("nvim-tree.api")

              -- -- --- DEBUG PRINTS ---
              -- -- Estas linhas irão imprimir o conteúdo de 'api' e 'api.node'
              -- -- no buffer de mensagens do Neovim (:messages).
              -- print("DEBUG: on_attach executado para nvim-tree. Buffer: " .. bufnr)
              -- print("DEBUG: Valor de 'api': " .. vim.inspect(api))
              -- print("DEBUG: Valor de 'api.node': " .. vim.inspect(api.node))
              -- print("DEBUG: Valor de 'api.node.navigate.parent_close': " .. vim.inspect(api.node.navigate.parent_close))
              -- -- --- FIM DEBUG PRINTS ---

              -- Função auxiliar para setar opções de mapeamento
              local function map_opts(desc)
                return { desc = tostring(desc), buffer = bufnr }
              end

              -- Mapeamentos comuns para nvim-tree
              -- Verifica se a função existe antes de mapear
              if api.node and type(api.node.open.edit) == 'function' then
                vim.keymap.set('n', 'l', api.node.open.edit, map_opts('Abrir'))
              end
              if api.node and type(api.node.navigate.parent_close) == 'function' then
                vim.keymap.set('n', 'h', api.node.navigate.parent_close, map_opts('Fechar Pai'))
              end
              if api.node and type(api.node.navigate.down) == 'function' then
                vim.keymap.set('n', 'j', api.node.navigate.down, map_opts('Baixo'))
              end
              if api.node and type(api.node.navigate.up) == 'function' then
                vim.keymap.set('n', 'k', api.node.navigate.up, map_opts('Cima'))
              end
              if api.tree and type(api.tree.change_root_to_node) == 'function' then
                vim.keymap.set('n', 'cd', api.tree.change_root_to_node, map_opts('Mudar Raiz'))
              end
              if api.fs and type(api.fs.rename) == 'function' then
                vim.keymap.set('n', 'r', api.fs.rename, map_opts('Renomear'))
              end
              if api.fs and type(api.fs.create) == 'function' then
                vim.keymap.set('n', 'a', api.fs.create, map_opts('Criar'))
              end
              if api.fs and type(api.fs.remove) == 'function' then
                vim.keymap.set('n', 'd', api.fs.remove, map_opts('Deletar'))
              end
              if api.fs and type(api.fs.copy.node) == 'function' then
                vim.keymap.set('n', 's', api.fs.copy.node, map_opts('Copiar'))
              end
              if api.fs and type(api.fs.paste) == 'function' then
                vim.keymap.set('n', 'p', api.fs.paste, map_opts('Colar'))
              end
              if api.tree and type(api.tree.toggle_help) == 'function' then
                vim.keymap.set('n', '?', api.tree.toggle_help, map_opts('Ajuda'))
              end
              if api.node and type(api.node.open.edit) == 'function' then -- Repetido, mas para garantir
                vim.keymap.set('n', '<CR>', api.node.open.edit, map_opts('Abrir'))
              end
              if api.node and type(api.node.open.vertical) == 'function' then
                vim.keymap.set('n', '<2-CR>', api.node.open.vertical, map_opts('Abrir Vertical'))
                vim.keymap.set('n', '<C-v>', api.node.open.vertical, map_opts('Abrir Vertical'))
              end
              if api.node and type(api.node.open.horizontal) == 'function' then
                vim.keymap.set('n', '<C-x>', api.node.open.horizontal, map_opts('Abrir Horizontal'))
              end
              if api.node and type(api.node.open.tab) == 'function' then
                vim.keymap.set('n', '<C-S-t>', api.node.open.tab, map_opts('Abrir Aba'))
              end
              if api.tree and type(api.tree.reload) == 'function' then
                vim.keymap.set('n', '<C-r>', api.tree.reload, map_opts('Recarregar'))
              end
          end) -- Fim do vim.schedule
      end,
    })
  end,
}
