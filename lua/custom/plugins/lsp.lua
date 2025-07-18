-- ~/.config/nvim/lua/custom/plugins/lsp.lua
-- Especificações de plugins para LSP (Language Server Protocol) e nvim-cmp

return {
  -- nvim-lspconfig: Essencial para configurar Language Servers
  { 'neovim/nvim-lspconfig' },

  -- mason.nvim: Gerenciador de Language Servers, formatadores e linters
  { 'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- mason-lspconfig.nvim: Integração do Mason com o nvim-lspconfig
  { 'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          "denols",    -- Para Deno (TypeScript/JavaScript)
          "lua_ls",    -- Para Lua
        },
      }
    end,
  },

  -- --- nvim-cmp: Autocompletar ---
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',   -- Fonte para completions de LSP
      'hrsh7th/cmp-buffer',     -- Fonte para completions do buffer atual
      'hrsh7th/cmp-path',       -- Fonte para completions de caminho de arquivo
      'saadparwaiz1/cmp_luasnip', -- Fonte para completions de LuaSnip
      'L3MON4D3/LuaSnip',       -- O próprio LuaSnip (garante que esteja disponível)
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Expande o snippet usando LuaSnip
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(), -- Inicia a completion

          -- Mapeamento para ENTER: Prioriza snippets, depois confirma outras seleções
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              local entry = cmp.get_selected_entry()
              if entry.source.name == 'luasnip' then
                luasnip.expand() -- Expande o snippet selecionado
              else
                cmp.confirm({ select = true }) -- Confirma outras seleções
              end
            else
              fallback() -- Comportamento padrão se o menu não estiver visível
            end
          end, { 'i', 's' }),

          -- Mapeamentos para navegar entre os itens de completion E snippets
          -- <Tab> para próximo item/placeholder
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Expande ou pula para o próximo placeholder do snippet
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- <Shift+Tab> para item/placeholder anterior
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- REMOVEMOS OS MAPEAMENTOS <C-j> e <C-k> AQUI para evitar conflito
          -- com seus mapeamentos de mover linhas, e para forçar o uso de Tab/S-Tab.
          -- Se você quiser mapear navegação no CMP para Ctrl+j/k, use-os apenas aqui.
          -- ['<C-j>'] = cmp.mapping.select_next_item(),
          -- ['<C-k>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
