-- ~/.config/nvim/lua/plugins/luasnip.lua

return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    -- 'saadparwaiz1/cmp_luasnip', -- Mantenha comentado por enquanto
  },
  config = function()
    print("LuaSnip config carregado!")

    local ls = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    ls.add_snippets("javascript", {
      ls.snippet({
        trig = "soma",
        dscr = "Função de soma de dois números",
      }, {
        ls.text_node("function "),
        ls.insert_node(1, "sum"),
        ls.text_node("("),
        ls.insert_node(2, "a"),
        ls.text_node(", "),
        ls.insert_node(3, "b"),
        ls.text_node(") {\n\treturn "),
        ls.insert_node(2),
        ls.text_node(" + "),
        ls.insert_node(3),
        ls.text_node(";\n}"),
        ls.insert_node(0),
      }),
      ls.snippet({
        trig = "soma_arrow",
        dscr = "Arrow Function de Soma",
      }, {
        ls.text_node("const "),
        ls.insert_node(1, "sumArrow"),
        ls.text_node(" = ("),
        ls.insert_node(2, "a"),
        ls.text_node(", "),
        ls.insert_node(3, "b"),
        ls.text_node(") => {\n\treturn "),
        ls.insert_node(2),
        ls.text_node(" + "),
        ls.insert_node(3),
        ls.text_node(";\n};"),
        ls.insert_node(0),
      }),
      ls.snippet({
        trig = "clog",
        dscr = "Console Log",
      }, {
        ls.text_node("console.log("),
        ls.insert_node(1, "variavel"),
        ls.text_node(");"),
        ls.insert_node(0),
      }),
    })

    -- Mapeamento para expandir ou pular para o próximo placeholder
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true, desc = "LuaSnip: Próximo Placeholder" })

    -- Mapeamento para pular para o placeholder anterior
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true, desc = "LuaSnip: Placeholder Anterior" })

    -- Autocomando para estender filetypes
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("LuasnipLoad", { clear = true }),
      callback = function(args)
        ls.filetype_extend(args.buf, { args.filetype })
      end,
    })

  end,
}
