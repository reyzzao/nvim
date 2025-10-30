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

-- Configura o Go com o gopls.
-- @mission: Habilita o LSP para Go (gopls).
-- Depende de: gopls e gofumpt.
lspconfig.gopls.setup({
    on_attach = functions.on_attach_default,
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiterals = true,
                constantValues = true,
                functionTypeSignature = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                fieldalignment = true,
                shadow = true,
                unusedparams = true,
            },
            gofumpt = true,
        },
    },
})

-- Configura o Dart/Flutter com o dartls.
-- @mission: Habilita o LSP para Dart e Flutter (dartls).
lspconfig.dartls.setup({
    on_attach = functions.on_attach_default,
    filetypes = { 
        "dart" 
    },
    -- Detecta o root do projeto Flutter/Dart
    root_dir = lspconfig.util.root_pattern("pubspec.yaml", ".git"), 
    settings = {
        dart = {
            -- Assume que o Flutter SDK ja esta configurado no PATH/variaveis de ambiente
            flutterSdkPath = vim.env.FLUTTER_ROOT, 
            completeFunctionCalls = true, -- Muito util para completion de funcoes Flutter
        },
    },
})