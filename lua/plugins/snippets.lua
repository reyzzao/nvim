-- @file: ~/.config/nvim/lua/plugins/snippets.lua
-- @mission: Configura o plugin 'nvim-cmp' para usar o 'LuaSnip' e gerencia todos os snippets globais.

-- Define a configuração do plugin para o LazyVim
return {
  -- Instala o plugin 'nvim-cmp' se ele não estiver presente
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Instala o LuaSnip como provedor de snippets
      { "L3MON4D3/LuaSnip", enabled = true },
    },
    -- Configuração do nvim-cmp para usar os snippets
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Mapeamento para expandir e saltar entre snippets
      opts.mapping["<C-k>"] = cmp.mapping(luasnip.jumpable(1), { "i", "s" })
      opts.mapping["<C-j>"] = cmp.mapping(luasnip.jumpable(-1), { "i", "s" })
      return opts
    end,
  },


  -- A configuração principal dos snippets
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    config = function()
      local luasnip = require("luasnip")
      local snip = luasnip.snippet
      local text = luasnip.text_node
      local insert = luasnip.insert_node

      -- Adiciona snippets ao LuaSnip
      -- O primeiro argumento é a linguagem, o segundo é uma lista de snippets
      luasnip.add_snippets("all", {
        --- @mission Snippet para criar uma função com documentação JSDoc/LSP-style.
        --- @args (filename: string, function_name: string)
        snip({
          trig = "func",
          dscr = "Snippet para função com doc",
        }, {
          text({ "--- @mission ${1:descrição da missão}" }),
          text({ "--- @args ${2:args}" }),
          text({ "--- @return ${3:retorno}" }),
          text({ "function ${4:nome_da_funcao}(" }),
          insert(2),
          text({ ") " }),
          text({ "local " }),
          insert(5),
          text({ " end" }),
        }),

        --- @mission Snippet para loop for com índices.
        --- @args (index: string, max_value: string, body: string)
        snip({ trig = "for", dscr = "Loop for" }, {
          text({ "for ${1:i} = 1, ${2:10} do" }),
          insert(3),
          text({ "end" }),
        }),

        snip({ trig = "ssmm", dscr = "Modelo fn soma" }, {
          text({ "const soma = (a, b) => a + b" }),
        }),

        --- @mission Snippet para estrutura de if-else.
        --- @args (condition: string, if_body: string, else_body: string)
        snip({ trig = "if", dscr = "Estrutura if-else" }, {
          text({ "if ${1:condicao} then" }),
          insert(2),
          text({ "else" }),
          insert(3),
          text({ "end" }),
        }),
        
        -- #define: Suas novas abreviações como snippets. - todo: testar pra ver se vai as chave100 e chave200
        snip({ trig = "soma_raiz100", dscr = "Função de soma" }, {
          text("function sum100(num1, num2) {\\n  return num1 + num2;\\n}"),
        }),
        snip({ trig = "chave100", dscr = "Texto da abreviação" }, {
          text("mostra a abreviacao: chave100"),
        }),
        snip({ trig = "chave200", dscr = "Texto da abreviação" }, {
          text("mostra a abreviacao: chave200"),
        }),
      })
    end,
  },
}