-- lua/custom/colorschemes/mytheme_tokyo.lua

-- Limpa quaisquer destaques existentes antes de aplicar os seus
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Define o background (bg) e foreground (fg) padrão
local M = {}

--------------------------------------------------------------------------------
-- AQUI VOCÊ ESCOLHE E ADAPTA SUA PALETA DE CORES
--------------------------------------------------------------------------------

-- Exemplo de Paleta: Inspirada em um Dark Mode neutro
M.palette = {
    bg = "#282c34",           -- Quase preto (fundo principal)
    fg = "#abb2bf",           -- Cinza claro (texto principal)
    comment = "#5c6370",      -- Cinza médio (comentários)
    red = "#e06c75",          -- Vermelho
    green = "#98c379",        -- Verde
    yellow = "#e5c07b",       -- Amarelo
    blue = "#61afef",         -- Azul
    purple = "#c678dd",       -- Roxo
    aqua = "#56b6c2",         -- Ciano/Água
    orange = "#d19a66",       -- Laranja
    grey = "#4b5263",         -- Cinza escuro (linhas, divisores)
    light_grey = "#a89984",   -- Um cinza mais quente (para números de linha inativos)
    accent_bg = "#323842",    -- Fundo para elementos como linha do cursor, barra de status
}

-- EXEMPLOS DE PALETAS INSPIRADAS (DESCOMENTE PARA TESTAR)
-- Você pode encontrar as paletas exatas nos repositórios oficiais dos temas.

-- Paleta inspirada em Dracula (HEX codes aproximados):
-- M.palette = {
--     bg = "#282a36",
--     fg = "#f8f8f2",
--     comment = "#6272a4",
--     red = "#ff5555",
--     green = "#50fa7b",
--     yellow = "#f1fa8c",
--     blue = "#bd93f9",
--     purple = "#ff79c6",
--     aqua = "#8be9fd",
--     orange = "#ffb86c",
--     grey = "#44475a",
--     light_grey = "#6272a4",
--     accent_bg = "#3a3c4e",
-- }

-- Paleta inspirada em Catppuccin-Mocha (HEX codes aproximados):
-- M.palette = {
--     bg = "#1e1e2e",
--     fg = "#cdd6f4",
--     comment = "#6c7086",
--     red = "#f38ba8",
--     green = "#a6e3a1",
--     yellow = "#f9e2af",
--     blue = "#89b4fa",
--     purple = "#cba6f7",
--     aqua = "#94e2d5",
--     orange = "#fab387",
--     grey = "#45475a",
--     light_grey = "#a6adc8",
--     accent_bg = "#313244",
-- }

-- Paleta inspirada em TokyoNight-Night (HEX codes aproximados):
-- M.palette = {
--     bg = "#1a1b26",
--     fg = "#c0caf5",
--     comment = "#565f89",
--     red = "#f7768e",
--     green = "#9ece6a",
--     yellow = "#e0af68",
--     blue = "#7aa2f7",
--     purple = "#bb9af7",
--     aqua = "#7dcfff",
--     orange = "#ff9e64",
--     grey = "#444b6a",
--     light_grey = "#a9b1d6",
--     accent_bg = "#2a2c3c",
-- }

--------------------------------------------------------------------------------
-- FUNÇÃO AUXILIAR PARA SETAR DESTAQUES (NÃO PRECISA MUDAR)
--------------------------------------------------------------------------------
-- Função auxiliar para setar destaques
local function set_hl(group, fg, bg, style)
    local opts = { link = nil }
    if fg then opts.fg = fg end
    if bg then opts.bg = bg end

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

--------------------------------------------------------------------------------
-- DEFINIÇÃO DOS GRUPOS DE DESTAQUE (ADAPTE CONFORME SUA NECESSIDADE)
--------------------------------------------------------------------------------

-- Destaques gerais (fundo, texto, linha do cursor, etc.)
set_hl("Normal", M.palette.fg, M.palette.bg)
set_hl("CursorLine", nil, M.palette.accent_bg)           -- Linha do cursor
set_hl("CursorLineNr", M.palette.yellow, M.palette.accent_bg, "bold") -- Número da linha do cursor
set_hl("LineNr", M.palette.light_grey, M.palette.bg)     -- Números de linha normais
set_hl("NonText", M.palette.comment)                    -- Caracteres como @@@, EndOfBuffer
set_hl("EndOfBuffer", M.palette.comment)                -- Tildes no final do buffer
set_hl("VertSplit", M.palette.grey)                     -- Divisores de janela
set_hl("Folded", M.palette.comment, M.palette.grey)      -- Código dobrado
set_hl("FoldColumn", M.palette.comment, M.palette.bg)    -- Coluna de dobramento
set_hl("SignColumn", M.palette.comment, M.palette.bg)    -- Coluna de sinais (diagnósticos)
set_hl("Pmenu", M.palette.fg, M.palette.grey)            -- Menu pop-up (autocompletion)
set_hl("PmenuSel", M.palette.bg, M.palette.blue)         -- Item selecionado no menu pop-up
set_hl("PmenuSbar", nil, M.palette.grey)                 -- Barra de rolagem do menu pop-up
set_hl("PmenuThumb", nil, M.palette.comment)             -- Thumb da barra de rolagem
set_hl("IncSearch", M.palette.bg, M.palette.yellow, "bold") -- Busca incremental
set_hl("Search", M.palette.bg, M.palette.orange)         -- Resultados de busca
set_hl("MatchParen", M.palette.red, nil, "bold,underline") -- Parênteses/chaves correspondentes
set_hl("ErrorMsg", M.palette.red, nil, "bold")           -- Mensagens de erro
set_hl("WarningMsg", M.palette.yellow, nil, "bold")      -- Mensagens de aviso
set_hl("InfoMsg", M.palette.blue, nil, "bold")           -- Mensagens de informação
set_hl("MoreMsg", M.palette.green, nil, "bold")          -- Mensagens "More"
set_hl("Question", M.palette.green, nil, "bold")         -- Perguntas

-- Barra de status
set_hl("StatusLine", M.palette.fg, M.palette.accent_bg)
set_hl("StatusLineNC", M.palette.comment, M.palette.grey)

-- Destaques de sintaxe comuns
set_hl("Comment", M.palette.comment, nil, "italic")
set_hl("String", M.palette.green)
set_hl("Character", M.palette.green)
set_hl("Number", M.palette.purple)
set_hl("Boolean", M.palette.purple)
set_hl("Float", M.palette.purple)
set_hl("Identifier", M.palette.blue)        -- Variáveis, nomes de funções (chamadas)
set_hl("Function", M.palette.aqua)          -- Definições de função (em algumas linguagens)
set_hl("Statement", M.palette.red, nil, "bold") -- Palavras-chave de controle (if, for, return)
set_hl("Conditional", M.palette.red)         -- if, else, switch
set_hl("Repeat", M.palette.red)              -- for, while, do
set_hl("Operator", M.palette.aqua)           -- Operadores (+, -, *, /)
set_hl("Keyword", M.palette.red)             -- Outras palavras-chave
set_hl("Type", M.palette.yellow, nil, "bold") -- Tipos de dados (int, string, struct)
set_hl("StorageClass", M.palette.orange)     -- static, public, private
set_hl("Structure", M.palette.yellow)        -- struct, class, union
set_hl("PreProc", M.palette.yellow)          -- Diretivas de pré-processador (#include, #define)
set_hl("Define", M.palette.purple)           -- #define
set_hl("Special", M.palette.aqua)            -- Caracteres especiais, escapes

-- Destaques de links (para grupos de destaque que linkam para outros)
-- Ex: "Keyword" pode linkar para "Statement" se não for definido.
-- Para quebrar o link e definir uma cor específica, use `set_hl("Grupo", cor, nil, "NONE")`

-- Destaques LSP e de Diagnóstico (muito importantes no Neovim moderno)
-- Erros, avisos, informações, etc., geralmente aparecem na coluna de sinais ou sublinhados
set_hl("DiagnosticError", M.palette.red, nil, "underline")
set_hl("DiagnosticWarn", M.palette.yellow, nil, "underline")
set_hl("DiagnosticInfo", M.palette.blue, nil, "underline")
set_hl("DiagnosticHint", M.palette.comment, nil, "underline")

-- Grupos de destaque para virtual text (diagnósticos inline)
set_hl("DiagnosticVirtualTextError", M.palette.red, nil, "NONE") -- Cor do texto do erro
set_hl("DiagnosticVirtualTextWarn", M.palette.yellow, nil, "NONE")
set_hl("DiagnosticVirtualTextInfo", M.palette.blue, nil, "NONE")
set_hl("DiagnosticVirtualTextHint", M.palette.comment, nil, "NONE")

-- Destaques para Tree-sitter (se você usar no futuro)
-- Nomes de grupos de destaque podem variar dependendo da gramática e do plugin.
-- Ex: @keyword.function, @function.call, @variable, @string
-- set_hl("@keyword", M.palette.red)
-- set_hl("@function", M.palette.aqua)
-- set_hl("@variable", M.palette.blue)
-- set_hl("@string", M.palette.green)

return M