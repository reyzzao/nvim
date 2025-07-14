-- ~/.config/nvim/lua/custom/plugins/cmp.lua

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',    -- Fonte de completude para LSP
    'hrsh7th/cmp-buffer',      -- Fonte de completude para buffer
    'hrsh7th/cmp-path',        -- Fonte de completude para caminhos
    'saadparwaiz1/cmp_luasnip', -- Integração com LuaSnip
    'L3MON4D3/LuaSnip',        -- O próprio LuaSnip como dependência direta aqui
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- --- Configuração do LuaSnip (Movida para cá) ---
    -- Carrega snippets no formato VS Code
    require('luasnip.loaders.from_vscode').lazy_load({
        -- Opcional: Especificar o caminho para seus snippets se não for o padrão
        -- paths = { vim.fn.stdpath("config") .. "/lua/custom/snippets" },
    })

    -- Mapeamentos de teclas para pular entre placeholders de snippets do LuaSnip
    -- Estes são para quando um snippet JÁ ESTÁ expandido.
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        -- Se não houver snippet ativo, você pode mapear para outra coisa
        -- ou deixar como está para não fazer nada.
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
    -- --- Fim da Configuração do LuaSnip ---


    -- --- Configuração do nvim-cmp ---
    cmp.setup({
      -- Mapeamentos de teclas para o menu de autocompletar
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Rolar docs para cima
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Rolar docs para baixo
        ['<C-Space>'] = cmp.mapping.complete(),  -- Forçar autocompletar
        ['<C-e>'] = cmp.mapping.abort(),         -- Abortar completude
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirmar seleção (Enter)

        -- Estes mapeamentos são para pular no menu de autocompletar,
        -- e também para expandir/pular snippets se o item selecionado for um snippet.
        -- Eles usam as funções do LuaSnip.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
      }),

      -- Fontes de completude (ordem importa para prioridade)
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },    -- Sugestões do Language Server
        { name = 'luasnip' },     -- Sugestões de snippets do LuaSnip
        { name = 'buffer' },      -- Sugestões de palavras do buffer atual
        { name = 'path' },        -- Sugestões de caminhos de arquivo
      }),

      -- Aparência do menu de autocompletar
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expande snippets usando LuaSnip
        end,
      },
      window = {
        completion = cmp.config.window.bordered(), -- Menu com bordas
        documentation = cmp.config.window.bordered(), -- Docs com bordas
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' }, -- O que mostrar no menu
        format = function(entry, vim_item)
          -- Adiciona um ícone para snippets
          if entry.source.name == 'luasnip' then
            vim_item.kind = 'Snippet'
            vim_item.menu = 'LS' -- Indica que é do LuaSnip
          end
          return vim_item
        end,
      },
      completion = {
        completeopt = 'menu,menuone', -- 'menu' mostra o menu, 'menuone' se só houver 1 item
      },
    })
  end,
}
