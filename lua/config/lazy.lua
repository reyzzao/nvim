-- @file: ~/.config/nvim/lua/config/lazy.lua
-- Este e o arquivo de configuracao do lazy.nvim.
-- Ele deve ser o ponto central para a definicao de todos os seus plugins.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- adiciona LazyVim e importa seus plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- importa/sobrescreve com seus plugins
    { import = "plugins" },
  },
  defaults = {
    -- Por padrao, apenas os plugins do LazyVim serao carregados de forma preguiçosa.
    -- Seus plugins personalizados serao carregados durante a inicializacao.
    lazy = false,
    -- E recomendado deixar version=false por enquanto, ja que muitos plugins que
    -- suportam versionamento tem releases desatualizadas, o que pode quebrar
    -- sua instalacao do Neovim.
    version = false, -- sempre usa o ultimo commit do git
    -- version = "*", -- tenta instalar a ultima versao estavel para plugins que suportam semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- verifica por atualizacoes de plugins periodicamente
    notify = false, -- notifica sobre a atualizacao
  },
  performance = {
    rtp = {
      -- desabilita alguns plugins de rtp
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})