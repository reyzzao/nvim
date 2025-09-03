-- ~/.config/nvim/lua/config/autocmds.lua

-- Define um grupo de autocomandos para organizar
vim.api.nvim_create_augroup('CustomAutocmds', { clear = true })

-- --- Auto-save ---
-- Salva o arquivo automaticamente ao sair do modo de inserção ou ao entrar em um novo buffer.
vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
    group = "CustomAutocmds",
    command = "silent! wa",
    desc = "Salva o arquivo automaticamente"
})

-- --- Sincroniza o diretorio de trabalho ---
-- Este autocomando garante que o terminal flutuante abra no diretorio
-- do arquivo que esta sendo editado
vim.api.nvim_create_autocmd("BufEnter", {
    group = "CustomAutocmds",
    pattern = "*",
    callback = function()
        local dir = vim.fn.expand("%:p:h")
        if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
            vim.cmd("cd " .. dir)
        end
    end,
    desc = "Sincroniza o diretorio com o do arquivo atual"
})