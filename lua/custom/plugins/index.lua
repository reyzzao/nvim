-- ~/.config/nvim/lua/custom/plugins/index.lua

-- Este arquivo é o ponto central para definir todos os seus plugins para o lazy.nvim.
-- Ele deve retornar uma tabela (lista) de especificações de custom.plugins.
-- Ele importa outros arquivos de plugin para modularidade.

return {
  -- --- Sempre que criar novo file nesta pasta -> chmae-o aqui ! ---
  { import = "custom.plugins.cmp" },
  { import = "custom.plugins.catppuccin" },
  { import = "custom.plugins.treesitter" },
  { import = "custom.plugins.lsp" },
  { import = "custom.plugins.notify" },
  { import = "custom.plugins.nvimtree" },
  { import = "custom.plugins.luasnip" }, 
  { import = "custom.plugins.telescope" },
}
