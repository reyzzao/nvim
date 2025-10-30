-- @file: ~/.config/nvim/init.lua
-- @mission: Inicializacao principal do Neovim, garantindo a ordem correta de carregamento.

-- 1. ESSENCIAL: Carrega a configuracao do Lazy e o inicializa, carregando plugins e o colorscheme.
-- Este passo carrega o TokyoNight (e dispara o evento ColorScheme).
require("config.lazy")
require("lazy").setup("plugins")

-- 2. Carrega Destaques e Configuracoes Atrasadas
-- O custom_highlights DEVE vir DEPOIS do setup do Lazy.
-- Ele garante que a cor do CursorLine seja definida por ultimo, após o colorscheme.
require("config.custom_highlights")

-- 3. Outras Configuracoes
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