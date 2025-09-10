-- @file: ~/.config/nvim/lua/plugins/tokyonight.lua
-- @mission: Instala e configura o tema Tokyo Night com o sabor Night.

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
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#0c0c78" })
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#0c0c78" })

  end,
}