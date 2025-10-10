-- @file: ~/.config/nvim/lua/plugins/cmp.lua
-- @mission: Configura o nvim-cmp para que o pop-up de auto completar só seja exibido ao pressionar Ctrl + Espaço, forçando um alto valor para min_chars.

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- ESSENCIAL: Garante que o Neovim use o modo passivo para autocompletar.
    vim.opt.completeopt = "menuone,noinsert,noselect" 

    local cmp = require('cmp')
    local ls = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ls.jumpable(-1) then
            ls.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp', min_chars = 99 }, 
        { name = 'luasnip', min_chars = 99 },
        { name = 'buffer', min_chars = 99 },
        { name = 'path', min_chars = 99 },
      }),
      formatting = {
        format = function(entry, vim_item)
          if ls.local_snips[entry.source.name] then
            vim_item.kind = 'Snippet'
            vim_item.menu = '[Snippet]'
          end
          return vim_item
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        autocomplete = false,
        auto_select = false, 
        trigger_characters = {}, 
      },
    })
  end,
}