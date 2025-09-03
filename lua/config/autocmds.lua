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

--[[
@mission: 
Auto comando: este arruivo autocmd serve para gerenciar Autocomandos, que são um tipo de "gatilho" no editor.

O que é um Autocomando?
Um Autocomando (autocmd para abreviar) é uma instrução que o Neovim executa automaticamente quando um evento específico acontece. Pense neles como a "inteligência" do Neovim.

Em vez de você ter que fazer algo manualmente (como formatar um arquivo ou mudar o diretório), o Neovim faz por você assim que o gatilho é acionado.

Funções Essenciais no Seu Sistema
O seu arquivo de autocomandos desempenha duas funções críticas:

Autoformatação ao Salvar: O autocomando BufWritePre é um gatilho que dispara antes que um arquivo seja salvo (WritePre). Ele verifica se o arquivo é compatível com o LSP (Language Server Protocol) e, se for, formata o seu código automaticamente. Isso garante que seu código esteja sempre limpo e consistente sem que você precise se lembrar de rodar um comando.

Sincronização de Diretórios: O autocomando BufEnter é o que resolveu o problema do terminal. Ele dispara toda vez que você entra em um buffer ou abre um arquivo (BufEnter). O que ele faz, na prática, é dizer ao Neovim para mudar seu diretório de trabalho para o mesmo diretório do arquivo que você acabou de abrir. Isso garante que o terminal flutuante sempre apareça na pasta do seu projeto.

Em resumo, o arquivo autocmds.lua é o cérebro que automatiza tarefas rotineiras, tornando seu fluxo de trabalho mais eficiente e permitindo que você se concentre apenas em escrever código.

]]