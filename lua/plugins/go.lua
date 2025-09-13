-- @file: ~/.config/nvim/lua/plugins/go.lua
-- @mission: Configura o lsp para golang, habilitando a formatacao e diagnosticos automaticos, incluindo erros de sintaxe fundamentais.

return {
  "neovim/nvim-lspconfig",
  ft = { "go", "gomod" },
  opts = {
    go = {
      cmd = { "gopls", "serve" },
      settings = {
        gopls = {
          -- Força a análise de todos os arquivos do projeto
          completeUnimported = true,
          buildFlags = { "-mod=mod" },
          gofumpt = true,
        },
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")

    -- Configuração de diagnóstico
    vim.diagnostic.config({
      -- Habilita o texto flutuante (tooltip) para mostrar a mensagem de erro
      float = true,
      -- Habilita o texto virtual (ao lado da linha)
      virtual_text = {
        -- Isso garante que o LSP mostre o erro na linha
        source = "always",
        severity = { min = vim.diagnostic.severity.HINT },
      },
      underline = true,
      signs = true,
    })

    local on_attach = function(client, bufnr)
      -- Formatação automática ao salvar
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end

    lspconfig.gopls.setup({
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = on_attach,
      cmd = opts.go.cmd,
      settings = opts.go.settings,
      root_dir = lspconfig.util.root_pattern("go.mod", "go.work"),
    })
  end,
}