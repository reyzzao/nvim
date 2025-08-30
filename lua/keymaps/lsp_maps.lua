-- @file: ~/.config/nvim/lua/keymaps/lsp_maps.lua

local map = vim.keymap.set

-- Mapeamentos de teclas para LSP
map('n', '<leader>li', vim.lsp.buf.hover, { desc = 'Recurso: LSP Hover >> mostra info de artefatos ao passar mouse., atalho:li de : Lsp info' })

map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format Code' })

