-- ~/.config/nvim/init.lua

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- --- 0. Configuração do Caminho para Módulos Lua ---
-- Adiciona o diretório 'lua' da sua configuração ao package.path do Lua.
-- Isso permite que 'require("plugins.main")' e outros 'require("custom.*")' funcionem.
-- O 'vim.fn.stdpath("config")' retorna o caminho para ~/.config/nvim/
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/lua/?.lua"

-- --- 0.1. Definição da Tecla <leader> ---
-- É CRÍTICO definir a tecla <leader> AQUI, antes de qualquer plugin ou mapeamento.
vim.g.mapleader = ' '      -- Define a barra de espaço como sua tecla <leader>
vim.g.maplocalleader = ' ' -- Define a barra de espaço como sua tecla <localleader>

-- --- 1. Carregamento de Outras Configurações Modulares ---
-- É CRÍTICO carregar suas opções e configurações de LSP *depois* que os plugins
-- (incluindo o colorscheme e lspconfig) forem configurados e carregados pelo lazy.nvim.

-- Carrega suas opções gerais do Neovim
-- Assumindo que você tem um arquivo em lua/custom/core/options.lua
require('custom.core.options')

-- Carrega as configurações dos seus Language Servers (LSPs)
-- Assumindo que você tem um arquivo em lua/custom/lsp/servers.lua
require('custom.lsp.servers')

-- Carrega seus mapeamentos de teclas e comandos personalizados
-- Assumindo que você tem um arquivo em lua/custom/keymaps/index.lua
require('custom.keymaps.index')

-- Este é o final do seu arquivo init.lua.
-- Evite adicionar muita lógica aqui para manter a clareza.
