-- @file: ~/.config/nvim/lua/plugins/indent-blankline.nvim.lua

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup({
      scope = { enabled = false },
      indent = {
        char = "│",
        tab_char = "│",
      },
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "alpha",
          "dashboard",
          "NeogitCommitMessage",
          "NvimTree",
          "Trouble",
          "toggleterm",
        },
      },
    })
  end,
}