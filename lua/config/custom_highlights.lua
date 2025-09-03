    -- ~/.config/nvim/lua/config/custom_highlights.lua

    -- Este arquivo define autocomandos para aplicar destaques personalizados,
    -- garantindo que eles tenham precedência sobre as configurações do colorscheme.

    -- local custom_background_hex = "#0d1017" -- <--- #editable #oficial : AQUI DEFINE O FUNDO DO EDITOR no: [ kitty, ] 
    -- local custom_background_hex = "#a6054b" -- <--- #editable Test cor rosa de fundo - descomente este e comenta o de cima  para testar

    -- Cria um grupo de autocomandos único para evitar conflitos.
    -- Isso garante que nossos autocomandos sejam os únicos neste grupo e não sejam sobrescritos.
    local custom_bg_augroup = vim.api.nvim_create_augroup("CustomBackgroundHighlights", { clear = true })

    -- Cria um autocomando para aplicar o fundo personalizado *depois* que o colorscheme é definido.
    -- O evento 'ColorScheme' é acionado sempre que um colorscheme é carregado.
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = custom_bg_augroup, -- Atribui ao nosso grupo único
      pattern = "*",             -- Aciona para qualquer colorscheme carregado
      callback = function()
        -- Sobrescreve a cor de fundo para os grupos de destaque relevantes.
        -- Usamos vim.cmd("highlight ...") para garantir a aplicação direta e com alta precedência.
        vim.cmd("highlight Normal guibg=" .. custom_background_hex)
        vim.cmd("highlight NormalFloat guibg=" .. custom_background_hex)
        vim.cmd("highlight EndOfBuffer guibg=" .. custom_background_hex)
        vim.cmd("highlight LineNr guibg=" .. custom_background_hex)
        vim.cmd("highlight FoldColumn guibg=" .. custom_background_hex)
        vim.cmd("highlight SignColumn guibg=" .. custom_background_hex)
        vim.cmd("highlight CursorLine guibg=" .. custom_background_hex)
        vim.cmd("highlight CursorLineNr guibg=" .. custom_background_hex)
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
      end,
    })
    