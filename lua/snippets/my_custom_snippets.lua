-- ~/.config/nvim/lua/luasnip/snippets/my_custom_snippets.lua

-- Este arquivo é para seus snippets personalizados do LuaSnip.
-- Ele será carregado automaticamente pelo LuaSnip se você tiver a configuração padrão
-- para carregar snippets de diretórios.

local ls = require("luasnip")

-- Adiciona snippets para o tipo de arquivo "all" (disponível em qualquer lugar)
-- Você pode mudar "all" para "lua", "python", "javascript", etc.,
-- se quiser que o snippet esteja disponível apenas para aquele tipo de arquivo.
ls.add_snippets("all", {
  ls.snippet(
    "testjump", -- O gatilho do snippet (o que você digita para ativá-lo)
    {
      ls.text_node("Isso é o "),
      ls.insert_node(1, "primeiro"), -- Placeholder 1 (você pula para aqui com Tab)
      ls.text_node(" teste. E este é o "),
      ls.insert_node(2, "segundo"), -- Placeholder 2 (você pula para aqui com Tab)
      ls.text_node(" teste. Fim."),
    },
    { description = "Snippet para testar pulo entre placeholders" } -- Descrição que aparecerá no nvim-cmp
  ),

  -- Você pode adicionar mais snippets aqui, por exemplo:
  -- ls.snippet(
  --   "myfunc",
  --   {
  --     ls.text_node("function "),
  --     ls.insert_node(1, "myFunctionName"),
  --     ls.text_node("() {"),
  --     ls.text_node("\n  "),
  --     ls.insert_node(2, "return true"),
  --     ls.text_node("\n}"),
  --   },
  --   { description = "Minha função de exemplo" }
  -- ),
})

-- Se você estiver usando o 'friendly-snippets' ou outro plugin que gerencia snippets,
-- ele geralmente tem uma forma de carregar snippets de diretórios.
-- O LuaSnip por si só também pode ser configurado para carregar automaticamente.
-- Se você tiver problemas para que este arquivo seja carregado, me avise como você
-- está carregando seus snippets atualmente (se é via 'friendly-snippets' ou outra forma).
