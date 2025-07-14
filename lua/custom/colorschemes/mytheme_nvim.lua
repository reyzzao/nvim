-- lua/custom/colorschemes/mytheme_nvim.lua

-- Recomendado: Limpar quaisquer destaques existentes antes de aplicar os seus
-- Isso é útil para garantir que seu tema seja aplicado de forma limpa.
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Define o background (bg) e foreground (fg) padrão
-- Estas são as cores principais do seu tema
local M = {}

M.palette = {
    -- Cores base
    bg = "#1e1e1e",           -- Fundo escuro (Dark Gray)
    fg = "#d4d4d4",           -- Texto claro (Light Gray)
    red = "#cc241d",          -- Vermelho
    green = "#98971a",        -- Verde
    yellow = "#d79921",       -- Amarelo
    blue = "#458588",         -- Azul
    purple = "#b16286",       -- Roxo
    aqua = "#689d6a",         -- Água
    orange = "#fe8019",       -- Laranja (para comentários, por exemplo)
    grey = "#a89984",         -- Cinza mais claro
    dark_grey = "#3c3836",    -- Cinza mais escuro (para linhas não ativas)
    light_grey = "#ebdbb2",   -- Cinza bem claro
}

-- Função auxiliar para setar destaques
local function set_hl(group, fg, bg, style)
    local opts = { link = nil }
    if fg then opts.fg = fg end
    if bg then opts.bg = bg end
    if style then opts.link = nil else opts.link = nil end -- Clear link if style is defined directly

    if style == "bold" then opts.bold = true
    elseif style == "italic" then opts.italic = true
    elseif style == "underline" then opts.underline = true
    elseif style == "reverse" then opts.reverse = true
    elseif style == "standout" then opts.standout = true
    elseif style == "undercurl" then opts.undercurl = true
    elseif style == "NONE" then -- Remove any style
        opts.bold = false
        opts.italic = false
        opts.underline = false
        opts.reverse = false
        opts.standout = false
        opts.undercurl = false
    end

    vim.api.nvim_set_hl(0, group, opts)
end

-- Define os destaques gerais
set_hl("Normal", M.palette.fg, M.palette.bg)
set_hl("CursorLine", nil, M.palette.dark_grey) -- Linha do cursor
set_hl("CursorLineNr", M.palette.yellow, M.palette.dark_grey, "bold") -- Número da linha do cursor
set_hl("LineNr", M.palette.grey, M.palette.bg) -- Números de linha normais
set_hl("NonText", M.palette.grey)              -- Caracteres como @@@
set_hl("EndOfBuffer", M.palette.dark_grey)     -- Tildes no final do buffer
set_hl("VertSplit", M.palette.dark_grey)       -- Divisores de janela
set_hl("Folded", M.palette.grey, M.palette.dark_grey) -- Código dobrado
set_hl("IncSearch", M.palette.bg, M.palette.yellow, "bold") -- Busca incremental
set_hl("Search", M.palette.bg, M.palette.orange) -- Resultados de busca
set_hl("StatusLine", M.palette.fg, M.palette.dark_grey) -- Barra de status normal
set_hl("StatusLineNC", M.palette.grey, M.palette.dark_grey) -- Barra de status de janela não selecionada

-- Destaques de sintaxe (exemplos comuns)
set_hl("Comment", M.palette.orange, nil, "italic") -- Comentários
set_hl("Constant", M.palette.purple)               -- Strings, números, booleanos
set_hl("String", M.palette.green)                  -- Strings
set_hl("Number", M.palette.purple)                 -- Números
set_hl("Boolean", M.palette.purple)                -- Booleanos
set_hl("Identifier", M.palette.blue)               -- Nomes de variáveis, funções
set_hl("Function", M.palette.blue)                 -- Funções
set_hl("Statement", M.palette.red, nil, "bold")    -- Palavras-chave (if, for, while)
set_hl("Keyword", M.palette.red, nil, "bold")      -- Outras palavras-chave
set_hl("PreProc", M.palette.yellow)                -- Diretivas de pré-processador (ex: #include)
set_hl("Type", M.palette.aqua, nil, "bold")        -- Tipos (int, char, class)
set_hl("Special", M.palette.yellow)                -- Caracteres especiais
set_hl("Error", M.palette.red, nil, "bold")        -- Erros (diagnósticos)
set_hl("Todo", M.palette.blue, M.palette.yellow, "bold") -- TODOs
set_hl("Underlined", M.palette.fg, nil, "underline") -- Texto sublinhado

-- Destaques LSP/Diagnósticos (importante para Neovim)
set_hl("DiagnosticError", M.palette.red, nil, "underline")
set_hl("DiagnosticWarn", M.palette.yellow, nil, "underline")
set_hl("DiagnosticInfo", M.palette.blue, nil, "underline")
set_hl("DiagnosticHint", M.palette.grey, nil, "underline")

set_hl("LspCxx_Type", M.palette.aqua) -- Exemplo para Treesitter/LSP (ajuste conforme seu uso)

return M