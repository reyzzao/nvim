-- ~/.config/nvim/init.lua

-- Este é o arquivo de configuração principal do Neovim.

-- --- 0. Configuração do Caminho para Módulos Lua ---
-- Adiciona o diretório 'lua' da sua configuração ao package.path do Lua.
-- Isso permite que 'require("custom.plugins.index")' e outros 'require("*")' funcionem.
-- O 'vim.fn.stdpath("config")' retorna o caminho para ~/.config/nvim/
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/lua/custom/?.lua"

-- --- 0.1. Definição da Tecla <leader> ---
-- É CRÍTICO definir a tecla <leader> AQUI, antes de qualquer plugin ou mapeamento.
vim.g.mapleader = ' '      -- Define a barra de espaço como sua tecla <leader>
vim.g.maplocalleader = ' ' -- Define a barra de espaço como sua tecla <localleader>

-- --- 1. Instalação e Configuração do lazy.nvim ---
-- Esta seção garante que o lazy.nvim esteja instalado e pronto para uso.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verifica se o lazy.nvim já existe. Se não, clona o repositório.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none",
                 "https://github.com/folke/lazy.nvim.git",
                 "--branch=stable", -- Garante que você está na versão estável
                 lazypath})
end

-- Adiciona o lazy.nvim ao runtimepath do Neovim.
vim.opt.rtp:prepend(lazypath)

-- Agora, carrega e configura o lazy.nvim.
-- A função 'setup' do lazy.nvim recebe a tabela de custom.plugins.
-- Estamos instruindo-o a carregar essa tabela do arquivo 'lua/custom/plugins/main.lua'.
require("lazy").setup(require("custom.plugins.index"), {
  -- --- Opções de configuração para o lazy.nvim (opcional) ---
  performance = {
    rtp = {
      disabled_plugins = {
        "harpoon",
        "matchup",
      },
    },
  },
})

-- --- 2. Carregamento de Outras Configurações Modulares ---
-- É CRÍTICO carregar suas opções e configurações de LSP *depois* que os plugins
-- (incluindo o colorscheme e lspconfig) forem configurados e carregados pelo lazy.nvim.

-- Carrega suas opções gerais do Neovim
require('custom.core.options')

-- Carrega as configurações dos seus Language Servers (LSPs)
require('custom.lsp.servers')

-- Carrega seus mapeamentos de teclas e comandos personalizados
require('custom.keymaps.index')

-- Este é o final do seu arquivo init.lua.
