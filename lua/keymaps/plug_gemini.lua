-- @file: ~/.config/nvim/lua/keymaps/plug_gemini.lua

local map = vim.keymap.set

-- Maps IA Gemini
map({ 'n' }, '<leader>pG', ':GeminiPrompt<CR>', { desc = 'Prompt Gemini' })
map({ 'v' }, '<leader>pg', ':GeminiCode<CR>', { desc = 'Gerar com Codigo' })