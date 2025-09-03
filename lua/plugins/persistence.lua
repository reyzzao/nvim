-- @file: ~/.config/nvim/lua/plugins/persistence.lua

return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- Carrega o plugin antes de ler um arquivo
  config = function()
    require('persistence').setup({
      -- opcional: configuração adicional
      dir = vim.fn.stdpath('data') .. '/persistence/', -- onde as sessões são salvas
      -- Opções de salvamento automático
      autosave = {
        enabled = true,
        -- Salva a sessão automaticamente ao fechar o Neovim
        on_exit = true,
        -- Salva a sessão automaticamente ao sair de um diretório
        on_pwd_change = false,
      },
    })
  end,
  -- Comando para restaurar a última sessão
  cmd = 'PersistenceLoad',
  -- Comando para deletar uma sessão
  keys = {
    { '<leader>qL', '<cmd>PersistenceLoad<cr>', desc = 'Load last session' },
  },
}