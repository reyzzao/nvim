-- @file: ~/.config/nvim/init.lua

require("config.lazy")
require("lazy").setup("plugins")
require("config.diagnostics")

-- AUXILIARES FORCE INIT
vim.opt.guicursor = "n:block,v:block,i:ver100,r:block,c:v" -- força cursor para IBeam - obs: aplique : $ `reset` no terminal antes.

-- ESSENCIAL: Desativa as dicas de parametros e tipos do LSP ( tentando limpar autocomplete intrometidos).
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("NoInlayHints", { clear = true }),
  callback = function(args)
    vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
  end,
})