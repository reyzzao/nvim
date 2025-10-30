-- @file: ~/.config/nvim/lua/config/custom_highlights.lua
-- @mission: Define destaques personalizados, garantindo que a cor de fundo e o CursorLine
--           sejam aplicados apos o colorscheme TokyoNight (usando atraso para precedencia).

-- Cores de Fundo Personalizadas
-- Por favor, ajuste estas cores conforme sua preferencia:
local custom_background_hex = "#0d1017" -- Sua cor de fundo padrao do editor (deve ser a cor do seu Kitty)

-- COR DE TESTE para CursorLine: AMAMRELO BRILHANTE (para garantir que funciona)
local custom_cursorline_bg = "#FFFF00"
local custom_cursorline_fg = "#000000" -- Preto para o texto na linha amarela

-- Cria um grupo de autocomandos unico para a funcao de destaque atrasada.
local custom_deferred_augroup = vim.api.nvim_create_augroup("CustomDeferredHighlights", { clear = true })

-- Funcao que aplica os destaques. Ela sera executada com um atraso.
local function apply_custom_highlights()
    
    -- 1. SOBRESCRITA GERAL (Fundo padrao do Editor)
    -- Esses comandos definem o fundo de TUDO para o custom_background_hex
    vim.cmd("highlight Normal guibg=" .. custom_background_hex)
    vim.cmd("highlight NormalFloat guibg=" .. custom_background_hex)
    vim.cmd("highlight EndOfBuffer guibg=" .. custom_background_hex)
    vim.cmd("highlight LineNr guibg=" .. custom_background_hex)
    vim.cmd("highlight FoldColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight SignColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight ColorColumn guibg=" .. custom_background_hex)
    vim.cmd("highlight Conceal guibg=" .. custom_background_hex)
    vim.cmd("highlight Pmenu guibg=" .. custom_background_hex)
    vim.cmd("highlight PmenuSel guibg=" .. custom_background_hex)
    vim.cmd("highlight VertSplit guibg=" .. custom_background_hex)
    vim.cmd("highlight StatusLine guibg=" .. custom_background_hex)
    vim.cmd("highlight StatusLineNC guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLine guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLineFill guibg=" .. custom_background_hex)
    vim.cmd("highlight TabLineSel guibg=" .. custom_background_hex)
    
    -- 2. DESTAQUE DA LINHA ATUAL (CursorLine) - PRIORIDADE ALTA
    
    -- Limpa o grupo de destaque primeiro, forçando um reset.
    vim.cmd("highlight clear CursorLine")
    vim.cmd("highlight clear CursorLineNr")
    
    -- Forca a aplicacao da cor de destaque (amarelo de debug)
    -- Usamos guibg (cor GUI) E ctermbg (cor terminal) para maior compatibilidade.
    vim.cmd("highlight CursorLine guibg=" .. custom_cursorline_bg .. " ctermbg=yellow")
    
    -- Forca a cor do NUMERO DA LINHA
    vim.cmd("highlight CursorLineNr guibg=" .. custom_cursorline_bg .. " ctermbg=yellow guifg=" .. custom_cursorline_fg .. " ctermfg=black bold")
end

-- Usa um Autocmd para chamar a funcao de destaque com um atraso (100ms).
-- Isso garante que ela so execute DEPOIS que o colorscheme TokyoNight terminar de carregar.
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- 100ms de atraso e o ponto ideal para garantir a precedencia.
        vim.defer_fn(apply_custom_highlights, 100) 
    end,
    group = custom_deferred_augroup,
})