-- ~/.config/nvim/lua/custom/plugins/luasnip.lua

return {
  'L3MON4D3/LuaSnip',
  config = function()
    local luasnip = require('luasnip')

    -- Define os caminhos onde o LuaSnip deve procurar por snippets.
    -- O 'from_vscode' loader espera que os subdiretórios sejam os filetypes.
    local snippet_base_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"
    
    -- Carrega snippets no formato VS Code de diretórios específicos.
    -- Adicionamos pcall aqui para capturar erros no carregamento do JSON.
    local success_vscode_loader, result_vscode_loader = pcall(function()
        return require('luasnip.loaders.from_vscode').lazy_load({
            paths = { snippet_base_path }
        })
    end)

    if not success_vscode_loader then
        vim.notify("Erro ao carregar snippets VS Code: " .. tostring(result_vscode_loader), "ERROR", { title = "LuaSnip Loader" })
    end

    -- REMOVEMOS O SNIPPET 'testesoma' DAQUI.
    -- Agora, o LuaSnip só tentará carregar snippets do seu arquivo JSON.

    -- Mapeamentos para pular entre placeholders (se um snippet for expandido)
    -- <C-k> para próximo placeholder, <C-j> para anterior.
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true, desc = "LuaSnip: Próximo Placeholder" })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true, desc = "LuaSnip: Placeholder Anterior" })
  end,
}
