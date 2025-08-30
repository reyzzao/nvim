-- @file: lua/user/lsp_config_formatters.lua

--- @mission: Configura o Language Server Protocol e os formatadores.
---            Este arquivo é chamado por init.lua.
--- @args:
---   - client: O objeto do cliente LSP.
---   - bufnr: O buffer number.

-- @mission: Define a função para atachar as configurações do LSP a um buffer.
-- @args:
--   - client: O objeto do cliente LSP.
--   - bufnr: O número do buffer.
return function(client, bufnr)
  -- A configuração do nvim-cmp agora é feita em 'lua/plugins/init.lua'.
  -- Não precisamos chamar require('cmp_nvim_lsp') aqui.
  
  -- Se o seu arquivo lida com formatters (como o nome sugere),
  -- o código deveria ser algo parecido com isso:
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     buffer = bufnr,
  --     callback = vim.lsp.buf.format,
  --   })
  -- end
end
