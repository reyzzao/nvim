-- ~/.config/nvim/lua/custom/keymaps/functions.lua

-- Exemplo de mapeamento para F2 para renomear
-- Esta função é geralmente chamada dentro de um autocomando quando um buffer de LSP é anexado.
-- No entanto, para um mapeamento global simples, você pode chamar diretamente.

vim.keymap.set('n', '<F2>', function()
  -- Verifica se um LSP está ativo no buffer atual para chamar a funcionalidade de renomeação.
  local clients = vim.lsp.buf_get_clients()
  if not vim.tbl_isempty(clients) then
    -- A função 'rename' de nvim-lsp-utils é a mais conveniente.
    -- Se você não usar nvim-lsp-utils, usaria vim.lsp.buf.rename().
    if require('nvim-lsp-utils').rename then
      require('nvim-lsp-utils').rename()
    else
      vim.lsp.buf.rename()
    end
  else
    vim.notify("Nenhum LSP ativo para renomear.", vim.log.levels.INFO)
  end
end, { desc = "LSP: Renomear Símbolo" })

-- Recarregar Configuração
vim.keymap.set("n", "<leader>rc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Configuração recarregada!", vim.log.levels.INFO) -- Recarrega o arquivo de configuração do Neovim.
end, { desc = "Recarregar config do Neovim" })


