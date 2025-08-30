-- @file: ~/.config/nvim/init.lua

-- Missão: Adicionar o caminho da pasta de configuração 'lua' para que os módulos sejam encontrados.
-- vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/lua")

-- Missão: Chamar o loader do LazyVim.
require("config.lazy")