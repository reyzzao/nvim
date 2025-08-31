-- @file: ~/.config/nvim/lua/plugins/rooter.lua

return {
  "airblade/vim-rooter",
  config = function()
    -- Desabilita o plugin por padrao
    vim.g.rooter_disable = 1

    -- Define um atalho para alternar o status do plugin : <leader>cr para desativá-lo.
    vim.keymap.set('n', '<leader>cr', function()
      -- Alterna o valor da variavel
      if vim.g.rooter_disable == 1 then
        vim.g.rooter_disable = 0
        print("vim-rooter habilitado!")
      else
        vim.g.rooter_disable = 1
        print("vim-rooter desabilitado!")
      end
    end, { desc = "Alternar vim-rooter" })

    -- Adicione a sua configuracao aqui, se necessaria
  end,
}