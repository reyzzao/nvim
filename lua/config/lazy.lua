-- @file: ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- recommended
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Outros plugins...
  
  -- Seu plugin do Gemini
  {
    "nvim-lua/plenary.nvim",
    "https://github.com/LuaDist/dkjson.git",
    name = "Gemini",
    event = "VimEnter",
    config = function()
      -- Seu código do Gemini
    end,
    keys = {
      { '<leader>pg', ':GeminiGenerate<CR>', mode = {'n', 'v'}, desc = 'Gerar conteudo com Gemini' },
    },
  },

  -- Carrega suas configuracoes personalizadas
  {
    "custom.loader",
    lazy = false,
    -- O evento garante que este plugin seja carregado assim que o Neovim iniciar
    event = "VimEnter",
    config = function()
      require("custom.loader")
    end,
  },

  -- Mais plugins...
})