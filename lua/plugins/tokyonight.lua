-- @file: ~/.config/nvim/lua/plugins/tokyonight.lua
-- @mission: Instala e configura o tema Tokyo Night e os destaques de diagnóstico.

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- Use este estilo para o sabor "night"
    style = "night",
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"

    -- Remove o sombreamento das janelas inativas para que o fundo seja consistente.
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    
    -- Muda a cor do "hover" (destaque do cursor) no nvim-tree
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#2d2d3e" })
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#5E81AC" })
    
    -- Configuração para mostrar o erro na linha em vermelho
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "NONE", sp = "red", undercurl = true, underline = true })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#E06C75", bold = true })
    
    -- Muda a cor do cursor (hover) no Neo-tree
    vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#2d2d3e", fg = "none" })
  end,
}