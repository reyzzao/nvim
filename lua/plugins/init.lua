-- ~/.config/nvim/lua/plugins/init.lua (ou main.lua)

-- Este é o arquivo principal que define todos os plugins para o lazy.nvim.
-- Ele pode importar outras tabelas de plugins de diferentes locais.

return {
  -- --- Plugins da Base LazyVim (exemplo) ---
  -- Você pode ter imports para plugins que vêm com a base do LazyVim
  -- { import = "lazyvim.plugins.basic" },
  -- { import = "lazyvim.plugins.editor" },
  -- { import = "lazyvim.plugins.lsp" },
  -- ...

  -- --- SEUS PLUGINS PERSONALIZADOS ---
  -- Importa todos os plugins definidos em 'lua/custom/plugins/'
  -- Isso permite que você mantenha seus plugins personalizados separados.
  { import = "custom.plugins" }, -- <--- IMPORTA SEUS PLUGINS PERSONALIZADOS

  -- Você também pode adicionar plugins diretamente aqui, se preferir,
  -- mas para manter a organização, o 'custom.plugins' é recomendado.
  -- Exemplo de um plugin adicionado diretamente:
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   lazy = false,
  --   config = function()
  --     require('nvim-tree').setup {}
  --   end,
  -- },
}
