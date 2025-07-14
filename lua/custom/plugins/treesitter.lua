-- ~/.config/nvim/lua/custom/plugins/treesitter.lua
-- Especificação do plugin nvim-treesitter para lazy.nvim
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Comando para instalar os parsers de linguagem
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Lista de linguagens para instalar automaticamente
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "css", "json" },
      -- Habilitar destaque de sintaxe
      highlight = {
        enable = true,
        -- Outras opções de destaque, se necessário
      },
      -- Habilitar indentação automática
      indent = { enable = true },
      -- Você pode adicionar outras configurações aqui, como parsers adicionais, textobjects, etc.
    }
  end,
}