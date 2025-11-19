-- @file: ~/.config/nvim/lua/custom/Index.lua
-- @mission: Opcoes globais e mapeamentos de teclado (keymaps) do usuario.

local map = vim.keymap.set

-- 1. Configuracoes Globais (Options)
vim.opt.nu = true
vim.opt.rnu = true

-- 2. Mapeamento de Atalhos Customizados
map("n", "<leader>m", ":messages<CR>", { desc = "Mostra Mensagens do Neovim" })

-- 3. Comandos (Se necessario)
vim.api.nvim_create_user_command('ShowMessages', function()
  vim.cmd('messages')
end, { nargs = 0, desc = 'Mostra o log de mensagens do Neovim' })

-- LINHA CRUCIAL: Retorna uma tabela vazia para satisfazer o Lazy.nvim
return {}