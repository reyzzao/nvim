-- ~/.config/nvim/lua/custom/lsp/servers.lua

local lspconfig = require('lspconfig')

-- --- Função on_attach Padrão ---
-- Esta função será chamada quando um Language Server se conectar a um buffer.
-- Ela centraliza os mapeamentos de teclas e outras configurações comuns.
local on_attach_default_config = function(client, bufnr)
    -- Mapeamentos de teclas para LSP (mantendo os que você já tem)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition', buffer = bufnr })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration', buffer = bufnr })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References', buffer = bufnr })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation', buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation', buffer = bufnr })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol', buffer = bufnr })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action', buffer = bufnr })
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true, buf = bufnr }) end, { desc = 'Format Code', buffer = bufnr })

    -- Habilitar formatação no save (opcional, se você não tem um formatador global)
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ async = true, buf = bufnr })
        end,
        desc = 'Auto-format on save via LSP',
    })

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
end

-- --- Configuração dos Language Servers ---

-- Deno LSP para TypeScript/JavaScript
lspconfig.denols.setup {
    -- Habilita recursos LSP que o Deno oferece
    init_options = {
        enable = true,
        lint = true,
        unstable = true,
    },
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git"),
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        on_attach_default_config(client, bufnr)
        if client.name == 'denols' then
             vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('DenoFormatGroup', { clear = true }),
                buffer = bufnr,
                callback = function()
                    if vim.bo[bufnr].filetype == 'typescript' or vim.bo[bufnr].filetype == 'javascript' or vim.bo[bufnr].filetype == 'json' then
                        vim.lsp.buf.format({ async = true, buf = bufnr })
                    end
                end,
                desc = 'Auto-format Deno files on save',
            })
        end
    end,
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'json', 'jsonc', 'markdown' },
}

-- Exemplo: Lua com Lua-LS
lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        on_attach_default_config(client, bufnr)
    end,
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
}
