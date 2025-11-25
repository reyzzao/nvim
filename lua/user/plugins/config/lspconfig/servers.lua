-- @file: ~/.config/nvim/lua/user/plugins/config/lspconfig/servers.lua
-- @mission: Define configuracoes especificas e padroes para Language Servers.

local M = {}
-- CORREÇÃO DEFINITIVA: 
-- Para acessar 'root_pattern' e 'path.dirname', 
-- é NECESSÁRIO importar o módulo 'lspconfig' e usar sua utilidade.
local lspconfig = require("lspconfig")
local lspconfig_util = lspconfig.util 
local utils = require("user.plugins.config.lspconfig.utils")
local omnisharp_dll = [[C:\tools\omnisharp\OmniSharp.dll]]

M.specific_configs = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    maxPreload = 10000,
                    preloadFileSize = 10000,
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
        -- Linha 31: lspconfig_util agora tem 'root_pattern'
        root_pattern = lspconfig_util.root_pattern(".git", ".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml"),
        root_dir = function(fname)
            return lspconfig_util.root_pattern(".git", ".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml")(
                fname
            ) or lspconfig_util.path.dirname(fname)
        end,
    },
    omnisharp = {
        cmd = { "dotnet", omnisharp_dll },
    },
    html = {
        -- AJUSTE: Binário para o pacote npm 'vscode-html-languageserver-bin'
        cmd = { "vscode-html-languageserver", "--stdio" },
        init_options = {
            provideFormatter = false,
        },
    },
    cssls = {
        -- AJUSTE: Binário para o pacote npm 'vscode-css-languageserver-bin'
        cmd = { "vscode-css-languageserver", "--stdio" },
    },
    eslint = {
        -- AJUSTE: Usando 'eslint_d' (daemon) que é um binário comum no Linux.
        cmd = { "eslint_d", "--stdio" },
        root_dir = lspconfig_util.root_pattern(
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
            "package.json",
            ".git"
        ),
        settings = { format = false },
    },
    emmet_ls = {
        filetypes = { "html" },
    },
}

M.default_config = {
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    flags = {
        debounce_text_changes = 500,
    },
}
return M