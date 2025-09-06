-- @file: ~/.config/nvim/lua/lsp/servers.lua
-- @mission: Configura os servidores de linguagem (LSP) para diferentes tipos de arquivos.

local lspconfig = require('lspconfig')
local functions = require('config.functions')

--- Configuração dos Language Servers ---

-- Configura o Deno LSP para TypeScript/JavaScript.
lspconfig.denols.setup({
    init_options = {
        enable = true,
        lint = true,
        unstable = true,
    },
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git"),
    on_attach = functions.on_attach_default,
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'json', 'jsonc', 'markdown' },
})

-- Configura o Lua com o Lua-LS.
lspconfig.lua_ls.setup({
    on_attach = functions.on_attach_default,
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