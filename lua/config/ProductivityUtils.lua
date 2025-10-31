-- @file: ~/.config/nvim/lua/config/ProductivityUtils.lua
-- @mission: Consolida funcoes e mapeamentos de teclado para aumentar a produtividade.

local M = {}

--- Lista apenas os triggers (palavras-chave) dos snippets no Telescópio
-- Esta função agora chama require() internamente para garantir que LuaSnip e Telescope
-- estejam carregados no momento em que o usuario pressiona o atalho.
function M.list_snippet_triggers()
  -- 1. Garante que os plugins estão disponíveis (Lazy-loading)
  local telescope_ok, telescope = pcall(require, "telescope.builtin")
  local luasnip_ok, luasnip = pcall(require, "luasnip")

  if not telescope_ok then
    vim.notify("Plugin Telescope não encontrado.", vim.log.levels.ERROR)
    return
  end
  if not luasnip_ok then
    vim.notify("Plugin LuaSnip não encontrado. Verifique sua config.", vim.log.levels.ERROR)
    return
  end

  local filetype = vim.bo.filetype
  -- 2. Tenta carregar os snippets se ainda não estiverem na cache
  -- Esta linha deve funcionar apos o require("luasnip") ser chamado
  local all_snippets = luasnip.all_snippets[filetype] or {}

  local triggers = {}
  -- 3. Itera sobre os snippets
  for _, list in pairs(all_snippets) do
    for _, snip_node in ipairs(list) do
      -- Trata o caso de um snip_node ser nil (por seguranca)
      if snip_node and snip_node.trig then
        table.insert(triggers, string.format("%s: %s", snip_node.trig, snip_node.dscr or "sem descrição"))
      end
    end
  end

  if #triggers == 0 then
    vim.notify("Nenhum snippet encontrado para o tipo de arquivo: " .. filetype, vim.log.levels.INFO)
    return
  end

  -- 4. Exibe a lista de triggers no Telescópio
  telescope.find_files({
    prompt_title = "LuaSnip Triggers (" .. filetype .. ")",
    find_command = { "echo", table.concat(triggers, "\n") },
    results_title = "Triggers: (Filtre e use Enter para inserir o trigger)",
    layout_strategy = "vertical",
    layout_config = {
      preview_width = 0.5,
    },
    attach_mappings = function(prompt_bufnr, _)
      local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        if not entry then return end
        local trigger_name = entry.value:match("([^:]+)")
        
        actions.close(prompt_bufnr)
        vim.cmd("normal! i" .. trigger_name)
      end)
      return true
    end,
  })
end


--- Configura os mapeamentos de teclado
function M.setup_keymaps()
  
  -- SNIPPETS (Prefixado com <leader>t ou <leader>s)
  -- @mission: Mapeamento para listar os triggers de snippet
  -- O mapeamento aponta para a funcao que sera carregada no momento do uso.
  vim.keymap.set('n', '<leader>psl', M.list_snippet_triggers, { desc = 'Telescope: List Snippet Triggers' })
end


-- Executa todos os mapeamentos ao carregar
M.setup_keymaps()

return M