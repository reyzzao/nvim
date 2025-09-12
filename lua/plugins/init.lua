-- Missao: Definir as configurações e dependências dos plugins do lazy.nvim.
-- @args: nenhum.
return {
  -- Missão: Gerenciar e carregar plugins com o Lazy.
  -- Esta é a configuração principal do lazy.nvim.
  "lazy.nvim",
  lazy = true,
  config = function()
    -- Missão: Carregar nosso core para garantir que a lógica personalizada seja executada.
    -- @args: nenhum.
    require("core.init").setup()
  end,

  -- Adiciona o plugin windwp/windline.nvim
  -- {
  --   "windwp/windline.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require('windline').setup({
  --       -- configurações do windline
        
  --     })
  --   end,
  -- },

  -- Se você tiver outros plugins, adicione-os aqui.
  -- Por exemplo:
  -- {
  --   "outro/plugin",
  --   -- configs
  -- },
}