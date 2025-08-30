-- @file: ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

--- Plug: Telescope - Maps

-- fucntions deps

map('n', '<leader>to', function() require('telescope.builtin').find_files() end, { desc = 'Buscar arquivos (Telescope)' })
map('n', '<leader>tf', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = 'Pesquisar no arquivo atual' })
map('n', '<C-g><C-f>', function() require('telescope.builtin').live_grep() end, { desc = 'Pesquisar no projeto (Live Grep)' })

-- keymaps
map('n', '<leader>tb', ':Telescope buffers<CR>', { desc = 'Mostra buffers recentes via telescope.' })

