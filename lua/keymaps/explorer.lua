-- @file: ~/.config/nvim/lua/keymaps/explorer.lua

return {}

-- Navegacao do Neo-tree
-- Subir um nivel
-- vim.keymap.set('n', '..', ":lua require('neo-tree.sources.filesystem').change_root('../')<CR>", { desc = "Subir um nivel no diretorio" })
-- -- Voltar para a raiz do projeto
-- vim.keymap.set('n', '<leader>pr', ":lua require('neo-tree.sources.filesystem').change_root(vim.fn.getcwd())<CR>", { desc = "Voltar a raiz do projeto" })
