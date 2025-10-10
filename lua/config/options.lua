-- ~/.config/nvim/lua/config/options.lua

-- Def tema colorscheme
-- vim.cmd("colorscheme catppuccin") -- TODO: TALVEZ ERA ONDE DEFNIAR O TEMA

-- --- Opções Gerais do Neovim ---

-- Ui
vim.cmd([[ set guicursor= ]]) -- deixar cursor estilo : IBeam
-- vim.cmd("set guicursor=n-v-c-i-sm:block,r-cr:hor,o:hor") -- deixar cursor estilo : IBeam -- todo: nao funciona da erro.

-- Linha onde esta o cursor : TODO : NAO ESTA FUNCIONANDO COM O TEMA TOKYONIGHT
vim.opt.cursorline = true --ESTA LINHA COLOCO NO TEMA EM USO : Habilita a exibição do fundo da linha do cursor 
vim.cmd('highlight CursorLine ctermbg=Yellow cterm=None') -- Define a cor de fundo da linha do cursor como laranja
vim.opt.cursorlineopt = 'both' -- Define as opções de exibição do fundo da linha do cursor opcoes [ 'both' = ambos/todos, 'line'= na linha atual, 'block' = na coluna atual ]

-- vim.cmd('highlight CursorLine ctermbg=Yellow cterm=None')
-- vim.o.cursorline = true

-- vim.cmd('highlight CursorLine ctermbg=Yellow cterm=None')
-- vim.o.cursorline = true

local font_formal = os.getenv("USE_FONT_IN_EDITOR") or "Fira Code" -- controlado em mybash : # @file: ~/.bash_aliases

vim.opt.guifont = font_formal .. ":h18" -- define tamanho da font
vim.opt.linespace = 6 -- Define o espaço extra entre as linhas (em pixels), como depende da font usando 6 ficou bom para Fira Code , inspiracao: no vscode é 1.5 por padrao, obs: por enquanto nao aceita numero flutuante aqui #evite_erros.


vim.opt.nu = true        -- Número de linha
vim.opt.relativenumber = true -- Números relativos
vim.opt.tabstop = 2      -- Tamanho do tab
vim.opt.shiftwidth = 2   -- Espaços para indentação
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

-- ~/.config/nvim/init.lua (para Lua API)

-- SETS SWP ARQUIVOS DE RECUPERACAO --==========================================
-- --- ATENÇÃO: Desabilitar swapfiles globalmente NÃO É RECOMENDADO ---
-- vim.opt.swapfile = false
-- Isso desabilita a recuperação de arquivos em caso de crash. Use com cautela!

-- --- Recomendado: Desabilitar swapfiles para diretórios específicos ---

-- Função auxiliar para desabilitar o swapfile localmente
local function disable_swapfile_local()
  vim.opt_local.swapfile = false
end

-- Exemplo: Não criar swapfiles em /tmp/
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "/tmp/*",
  callback = disable_swapfile_local,
  desc = "Disable swapfile for /tmp/"
})

-- Exemplo: Não criar swapfiles no diretório de Downloads
-- Usa vim.fn.expand para expandir '~' corretamente
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = vim.fn.expand("~") .. "/Downloads/*",
  callback = disable_swapfile_local,
  desc = "Disable swapfile for Downloads"
})

-- Exemplo: Não criar swapfiles para arquivos de log
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.log",
  callback = disable_swapfile_local,
  desc = "Disable swapfile for log files"
})

-- Você pode adicionar mais padrões aqui.
-- O 'vim.opt_local.swapfile = false' garante que a opção seja aplicada apenas ao buffer atual.

-- ================= FIM SWP SETS ==============================================
