-- @file: lua/custom/git-config.lua

--- @mission: Configurações personalizadas para plugins e ferramentas relacionadas ao Git.
--- Este arquivo centraliza atalhos e comportamentos para o gitsigns.nvim.
--- @args: Não há argumentos.

-- Requer o gitsigns, que já deve estar instalado e configurado via lazy.nvim.
local gitsigns = require("gitsigns")

-- Configura os atalhos de teclado (keymaps) para o modo normal.
vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk) -- Pula para a alteração anterior.
vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk) -- Pula para a próxima alteração.
vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk) -- "Stage" a alteração atual.
vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk) -- Reverte a alteração atual.
vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer) -- "Stage" todas as alterações no buffer.
vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer) -- Reverte todas as alterações no buffer.
vim.keymap.set("n", "<leader>gv", gitsigns.preview_hunk_inline) -- Mostra a alteração atual em um "preview".
vim.keymap.set("n", "<leader>gb", function() gitsigns.blame_line({full=true}) end) -- Mostra a linha do blame.

