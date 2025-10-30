-- @file: ~/.config/nvim/lua/custom/plugins/treesitter.lua
-- @mission: Configura o nvim-treesitter para realce de sintaxe e indentacao, incluindo Go e Dart.

return {
  'nvim-treesitter/nvim-treesitter',
  -- Adiciona lazy = false para garantir que o plugin seja carregado na inicializacao
  lazy = false, 
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 
        "c", 
        "cpp", 
        "lua", 
        "vim", 
        "vimdoc", 
        "query", 
        "javascript", 
        "typescript", 
        "html", 
        "css", 
        "json",
        "markdown",
        "markdown_inline",
        -- NOVOS: Adicionados para Go e Dart/Flutter
        "go",         
        "dart",       
        "toml",       
        "bash",       
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}