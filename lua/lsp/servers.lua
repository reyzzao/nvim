-- @file: ~/.config/nvim/lua/lsp/servers.lua

local lspconfig = require('lspconfig')

--- Anexa o comportamento e as configurações específicas a um buffer
--- quando um cliente LSP é iniciado.
local function on_attach_default(client, bufnr)
    -- Mapeamentos de teclas comuns para LSP
    -- Apenas mapeamentos que precisam de 'buffer = bufnr'
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation', buffer = bufnr })
    
    -- Configurações para lista de diagnósticos (erros/warnings)
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })
    
    -- Autocmd para formatar no save, se o servidor oferecer essa capacidade
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = true }),
        buffer = bufnr,
        callback = function()
            -- Apenas formata se o servidor tiver a capacidade de formatação
            if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
                vim.lsp.buf.format({ async = true, buf = bufnr })
            end
        end,
        desc = 'Auto-format on save via LSP',
    })
end

--- Configuração dos Language Servers ---

-- Configura o Deno LSP para TypeScript/JavaScript.
lspconfig.denols.setup({
    init_options = {
        enable = true,
        lint = true,
        unstable = true,
    },
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git"),
    on_attach = on_attach_default,
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'json', 'jsonc', 'markdown' },
})

-- Configura o Lua com o Lua-LS.
lspconfig.lua_ls.setup({
    on_attach = on_attach_default,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})