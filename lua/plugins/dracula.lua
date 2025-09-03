-- ~/.config/nvim/lua/plugins/dracula.lua

-- Configura o plugin Dracula para Neovim e aplica destaques personalizados.

return {
  "dracula/vim", -- Repositório oficial do tema Dracula para Vim/Neovim
  name = "dracula", -- Nome do plugin (importante para o LazyVim)
  priority = 1000,   -- Garante que o colorscheme seja carregado cedo

  -- Use 'init' para definir opções muito cedo, antes que outros plugins possam interferir.
  init = function()
    -- Ativa o suporte a cores verdadeiras (true colors) no terminal.
    -- É bom ter certeza de que esta linha está ativa em algum lugar da sua configuração,
    -- preferencialmente em lua/config/options.lua.
    vim.opt.termguicolors = true
  end,

  config = function()
    -- Define o Dracula como o colorscheme ativo.
    -- É crucial que esta linha seja executada para aplicar o tema.
    vim.cmd.colorscheme "dracula"

    -- Define a cor de fundo personalizada.
    -- Esta cor será aplicada *depois* que o colorscheme Dracula for carregado.
    local custom_background_hex = "#0d1017" -- #editable - aqui muda a cor de fundo deste tema
    -- local custom_background_hex = "#a6054b" -- Cor rosa de fundo para test - descomente apra testar e comente a de cima.

    -- Aplica a cor de fundo personalizada para os grupos de destaque relevantes.
    -- Isso sobrescreve as configurações de fundo do Dracula.
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
}
