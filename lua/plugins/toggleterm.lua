-- @file: ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapped = true,
    direction = "float",
    shell = "/bin/bash",
    -- A forma correta de definir o diretorio de trabalho
    -- O 'nil' faz com que o terminal inicie no CWD do Neovim
    cwd = nil,
  },
  keys = {
    {
      "<leader>tt",
      "<cmd>ToggleTerm<cr>",
      desc = "Alternar Terminal Flutuante",
    },
  },
  on_create = function(t)
    vim.keymap.set('t', '<C-d>', '<C-d>', {
      desc = "Fechar terminal com C-d",
      buffer = t.bufnr,
    })
  end,
}