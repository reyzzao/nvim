-- @file: ~/.config/nvim/lua/lsp/servers.lua

local lspconfig = require('lspconfig')

--- Anexa o comportamento e as configurações específicas a um buffer
    
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