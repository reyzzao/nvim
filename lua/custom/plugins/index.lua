-- ~/.config/nvim/lua/custom/plugins/index.lua

-- Este arquivo é o ponto central para definir todos os seus plugins para o lazy.nvim.
-- Ele deve retornar uma tabela (lista) de especificações de plugins.
-- Ele importa outros arquivos de plugin para modularidade.

return {
  -- --- Plugins Individuais (importados de arquivos separados) ---
  -- Estes são os seus plugins personalizados.

  -- Catppuccin: Geralmente é um tema, e você pode querer sua própria configuração.
  { import = "custom.plugins.catppuccin" },

  -- LSP (mason, lspconfig): Essencial e provavelmente você tem configurações específicas.
  { import = "custom.plugins.lsp" },

  -- --- Plugins que o LazyVim já pode incluir ---
  -- Comente estes 'import's inicialmente.
  -- Se você precisar personalizar, descomente e edite o arquivo correspondente.

  -- Treesitter: O LazyVim já tem uma configuração robusta.
  -- { import = "custom.plugins.treesitter" },

  -- nvim-notify: O LazyVim pode ter seu próprio sistema de notificação ou integração.
  -- { import = "custom.plugins.notify" },

  -- nvim-tree.lua: O LazyVim geralmente tem um explorador de arquivos padrão.
  { import = "custom.plugins.nvimtree" },

  -- Telescope: O LazyVim tem uma integração profunda com Telescope.
  -- { import = "custom.plugins.telescope" }, -- Adicione esta linha se você tiver um arquivo telescope.lua em custom/plugins

  -- --- Outros Plugins ---
  -- Adicione aqui qualquer outro plugin que você queira e que o LazyVim não inclua.
}
