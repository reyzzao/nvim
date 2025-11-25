-- @file: ~/.config/nvim/lua/user/plugins/config/lspconfig/init.lua
-- @mission: Configura diagnosticos, handlers e inicia os Language Servers.

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = " ",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
vim.fn.sign_define("DiagnosticsSignError", { text = ICON_ERROR })
vim.fn.sign_define("DiagnosticsSignWarning", { text = ICON_WARN })
vim.fn.sign_define("DiagnosticsSignInformation", { text = ICON_INFO })
vim.fn.sign_define("DiagnosticsSignHint", { text = ICON_HINT })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

-- REMOVIDO: Bloco 'local present, lspconfig = pcall(require, "lspconfig")'
-- O aviso de depreciação era emitido aqui.

local servers = require("user.plugins.config.lspconfig.servers")

for _, lsp in ipairs(SERVERS) do
    local config = servers.specific_configs[lsp] or {}
    config = vim.tbl_extend("keep", config, servers.default_config)
    
    -- NOVO MÉTODO: Acessa o módulo 'lspconfig' e o servidor diretamente
    -- Este pcall ajuda a evitar erros se o servidor não existir
    local ok, lsp_module = pcall(require, "lspconfig")
    
    -- Linha equivalente à antiga 39, mas sem usar a variável lspconfig depreciada
    if ok and lsp_module[lsp] then
        lsp_module[lsp].setup(config)
    end
end