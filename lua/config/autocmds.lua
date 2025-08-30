-- ~/.config/nvim/lua/config/autocmds.lua

-- Define um grupo de autocomandos para organizar
vim.api.nvim_create_augroup('CustomAutocmds', { clear = true })

-- --- Autoformatação ao Salvar ---
-- Este autocomando geral chama a formatação LSP para qualquer buffer
-- onde um Language Server esteja ativo e suporte formatação.
vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'CustomAutocmds',
    callback = function()
        -- Verifica se o buffer atual é modificável e não é um tipo de arquivo especial (como NvimTree)
        if vim.bo.modifiable and not vim.tbl_contains({'NvimTree', 'packer', 'log', 'gitcommit', 'gitrebase', 'help'}, vim.bo.filetype) then
            vim.lsp.buf.format({ async = true })
        end
    end,
    desc = 'Auto-format LSP-supported files on save',
})

-- Outros autocomandos que você queira adicionar, por exemplo:

-- vim.api.nvim_create_autocmd('FileType', {
--     group = 'CustomAutocmds',
--     pattern = 'lua',
--     callback = function()
--         vim.opt_local.tabstop = 2
--         vim.opt_local.shiftwidth = 2
--     end,
--     desc = 'Set tab/shiftwidth for Lua files',
-- })
