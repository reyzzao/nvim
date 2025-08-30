-- @file: lua/plugins/gitsigns.lua

--- @mission: Configura o plugin gitsigns.nvim.
--- @args: Não há argumentos.

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    -- @mission: Configura o gitsigns para feedback visual, desabilitando o destaque
    -- automático de palavras.
    -- @args: Não há argumentos.
    local gitsigns = require("gitsigns")
    gitsigns.setup {
      -- Sinais visuais na 'gutter' (coluna lateral).
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      -- DESLIGA o "word highlight" por padrão, já que você não gostou.
      word_diff = false,
      -- Mapeamentos de atalhos de teclado (keymaps) para o modo normal.
      -- Eles ficarão disponíveis apenas se o plugin for carregado.
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Mapeamentos para navegar entre as alterações.
        vim.keymap.set("n", "<leader>gn", function() gs.next_hunk() end, { desc = "Git: Pular para a próxima alteração" })
        vim.keymap.set("n", "<leader>gp", function() gs.prev_hunk() end, { desc = "Git: Pular para a alteração anterior" })

        -- Mapeamentos para dar 'stage', 'reset' e 'preview' nas alterações.
        vim.keymap.set("n", "<leader>gs", function() gs.stage_hunk() end, { desc = "Git: Stage a alteração atual" })
        vim.keymap.set("n", "<leader>gr", function() gs.reset_hunk() end, { desc = "Git: Reverter a alteração atual" })
        vim.keymap.set("n", "<leader>gS", function() gs.stage_buffer() end, { desc = "Git: Stage todas as alterações no buffer" })
        vim.keymap.set("n", "<leader>gR", function() gs.reset_buffer() end, { desc = "Git: Reverter todas as alterações no buffer" })
        vim.keymap.set("n", "<leader>gv", function() gs.preview_hunk() end, { desc = "Git: Preview alteração" })
        vim.keymap.set("n", "<leader>gb", function() gs.blame_line() end, { desc = "Git: Mostra blame da linha (persiste)" })
      end,
    }
  end,
}
