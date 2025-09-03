-- @file: lua/custom/NoFormatOnSave.lua

local M = {}

-- @mission: Salva a função original de formatação do LSP para que possamos chamá-la se a formatação não estiver desabilitada.
local originalFormat = vim.lsp.buf.format

--- setup()
-- @mission: Configura o sistema de desabilitação da formatação.
-- Intercepta a função de formatação do LSP para adicionar uma verificação de "desabilitação".
-- Cria um comando para o usuário desabilitar a formatação no buffer atual.
-- @args: none
function M.setup()
    -- @mission: Intercepta a função de formatação do buffer do LSP.
    -- Esta é a nova função que será chamada quando qualquer plugin tentar formatar.
    vim.lsp.buf.format = function(opts)
        -- @mission: Checa se a variável de desabilitação de formatação está ativada no buffer.
        -- Se `vim.b.no_format_on_save` for `true`, a função retorna sem chamar a formatação original.
        if vim.b.no_format_on_save then
            vim.notify("Formatação evitada para o buffer atual. Use :EnableFormatOnSave para reativar.", vim.log.levels.INFO, { title = "Formatação Ignorada" })
            return
        end
        -- @mission: Chama a função de formatação original.
        -- Se a variável de desabilitação for `false` ou `nil`, a formatação prossegue normalmente.
        originalFormat(opts)
    end

    -- @mission: Cria um comando para desabilitar a formatação para o buffer atual.
    -- O comando é acessível no Neovim através de `:NoFormatOnSave`.
    vim.api.nvim_create_user_command('NoFormatOnSave', function()
        vim.b.no_format_on_save = true
        vim.notify("Formatação desabilitada para o buffer atual.", vim.log.levels.INFO, { title = "Formatação Desabilitada" })
    end, {})

    -- @mission: Cria um comando para reabilitar a formatação.
    vim.api.nvim_create_user_command('EnableFormatOnSave', function()
        vim.b.no_format_on_save = false
        vim.notify("Formatação reabilitada para o buffer atual.", vim.log.levels.INFO, { title = "Formatação Reabilitada" })
    end, {})

end

return M
