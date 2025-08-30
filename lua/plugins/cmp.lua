-- ~/.config/nvim/lua/plugins/cmp.lua

-- Este arquivo configura o nvim-cmp, o plugin de autocompletar.
-- Ele DEVE retornar uma tabela no formato que LazyVim espera.

return {
  'hrsh7th/nvim-cmp', -- O nome do repositório do plugin nvim-cmp
  event = 'InsertEnter', -- Carrega o plugin apenas quando você entra no modo de inserção
  dependencies = {
    'L3MON4D3/LuaSnip', -- Certifique-se de que LuaSnip é uma dependência aqui também
    'saadparwaiz1/cmp_luasnip', -- Source para integrar LuaSnip com nvim-cmp
    'hrsh7th/cmp-nvim-lsp', -- Source para autocompletar do LSP
    'hrsh7th/cmp-buffer', -- Source para autocompletar do buffer atual
    'hrsh7th/cmp-path', -- Source para autocompletar caminhos de arquivo
  },
  config = function()
    local cmp = require('cmp')
    local ls = require('luasnip') -- Carrega o módulo LuaSnip

    cmp.setup({
      -- Configuração para expandir snippets
      snippet = {
        -- Função que o nvim-cmp vai chamar para expandir um snippet.
        -- É crucial que ele use ls.lsp_expand para compatibilidade.
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      -- Mapeamentos de teclas para navegação e seleção
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Rolar docs para cima
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Rolar docs para baixo
        ['<C-Space>'] = cmp.mapping.complete(),  -- Acionar autocompletar manualmente
        ['<C-e>'] = cmp.mapping.abort(),         -- Abortar autocompletar
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirmar seleção
        -- Mapeamento para <Tab>: expandir snippet OU pular para o próximo placeholder
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Se o menu de autocompletar estiver visível, selecione o próximo item
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump() -- Se houver um snippet para expandir ou um placeholder para pular, faça isso
          else
            fallback() -- Caso contrário, deixe o <Tab> fazer sua função padrão (indentar)
          end
        end, { 'i', 's' }), -- 'i' para modo de inserção, 's' para modo de snippet
        -- Mapeamento para <S-Tab>: pular para o placeholder anterior
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Se o menu de autocompletar estiver visível, selecione o item anterior
          elseif ls.jumpable(-1) then
            ls.jump(-1) -- Se houver um placeholder anterior para pular, faça isso
          else
            fallback() -- Caso contrário, deixe o <S-Tab> fazer sua função padrão
          end
        end, { 'i', 's' }),
      }),
      -- Fontes de autocompletar
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Sugestões do Language Server Protocol
        { name = 'luasnip' },  -- **MUITO IMPORTANTE: Esta linha integra o LuaSnip**
        { name = 'buffer' },   -- Sugestões do buffer atual
        { name = 'path' },     -- Sugestões de caminhos de arquivo
      }),
      -- Outras configurações visuais (opcional, mas recomendado para uma boa UX)
      formatting = {
        format = function(entry, vim_item)
          -- Adiciona um ícone ou texto para identificar snippets
          if ls.local_snips[entry.source.name] then
            vim_item.kind = 'Snippet'
            vim_item.menu = '[Snippet]'
          end
          return vim_item
        end,
      },
      -- Configurações para o menu de autocompletar
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
