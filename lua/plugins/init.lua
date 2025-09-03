-- @file: lua/plugins/init.lua

-- Missao: Definir as configuracoes e dependencias dos plugins do lazy.nvim.
-- @args: nenhum.
return {
  -- Missao: Gerenciar e carregar plugins com o Lazy.
  -- Esta eh a configuracao principal do lazy.nvim.
  "lazy.nvim",
  lazy = true,
  config = function()
    -- Missao: Carregar o nosso core para garantir que a logica personalizada seja executada.
    -- @args: nenhum.
    require("core.init").setup()
  end,

  -- Se voce tiver outros plugins, adicione-os aqui.
  -- Por exemplo:
  -- {
  --   "outro/plugin",
  --   -- configs
  -- },
}
