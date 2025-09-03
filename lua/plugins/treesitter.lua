-- ~/.config/nvim/lua/custom/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 
        "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "css", "json",
        "markdown",
        "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}