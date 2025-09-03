-- @file: ~/.config/nvim/lua/custom/terminal_custom.lua 

-- abaixo para funcionar o ctr+click no terminal --
vim.api.nvim_set_option('path', vim.fn.substitute(vim.fn.getcwd(), '/', '\\/', 'g')) -- terminal mostrar o endereco dclicavel certoe erro cli
vim.api.nvim_set_option('tags', '~/dotfiles/nvim/.config/nvim/tags/tags') -- Define o caminho para o ARQUIVO de tags - para abrir links clicaveis no terminal

-- configura o Neovim para abrir o arquivo correto quando você clica com o lado direito do mouse
vim.api.nvim_set_keymap('n', '<C-Click>', ':e <cfile><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<RightMouse>', ':e <cfile><CR>', { noremap = true, silent = true })