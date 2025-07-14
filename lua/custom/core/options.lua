-- ~/.config/nvim/lua/custom/core/options.lua

-- Def tema colorscheme
vim.cmd("colorscheme catppuccin") 

-- --- Opções Gerais do Neovim ---

-- Informa ao Neovim que o fundo do terminal é escuro (importante para alguns temas)
vim.opt.background = 'dark'

vim.opt.nu = true        -- Número de linha
vim.opt.relativenumber = true -- Números relativos
vim.opt.tabstop = 4      -- Tamanho do tab
vim.opt.shiftwidth = 4   -- Espaços para indentação
vim.opt.expandtab = true -- Usa espaços ao invés de tabs
vim.opt.smartindent = true -- Indentação inteligente
vim.opt.wrap = false     -- Não quebra linha
vim.opt.swapfile = false -- Não cria arquivos de swap
vim.opt.undofile = true  -- Persiste o histórico de undo
vim.opt.hlsearch = true  -- Destaca resultados de busca
vim.opt.incsearch = true -- Busca incremental
vim.opt.termguicolors = true -- Cores para o terminal (CRÍTICO para True Color)
vim.opt.scrolloff = 8    -- Linhas de contexto ao scrollar
vim.opt.signcolumn = 'yes' -- Sempre mostra a coluna dos sinais (diagnostics)
vim.opt.isfname:append("@-@") -- Caracteres extras para nomes de arquivos
vim.opt.updatetime = 300 -- Tempo para o Neovim esperar antes de escrever swap e disparar eventos
vim.opt.timeoutlen = 500 -- Tempo para mapeamentos parciais

-- Para copiar e colar fora do Neovim
vim.opt.clipboard = 'unnamedplus'

-- Definição da tecla <leader> (geralmente \ ou , ou espaço)
vim.g.mapleader = ' '      -- Define a barra de espaço como sua tecla <leader>
vim.g.maplocalleader = ' ' -- Define a barra de espaço como sua tecla <localleader>
