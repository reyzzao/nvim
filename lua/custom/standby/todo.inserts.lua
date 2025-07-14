-- TODO INSERTS

-- Sair
-- vim.keymap.set("n", "<F12>", "<Cmd>wq!<CR>", { desc = "Salvar e fechar todas as janelas" }) -- Salva e fecha todas as janelas (mata o editor).
vim.keymap.set("n", "<A-ww>", function()
  -- Fecha todos os buffers, perguntando por modificações se não salvos
  vim.cmd('qa')
end, { desc = "Fechar todos os buffers e abrir novo vazio" })

-- vim.keymap.set("n", "<F12>", function() -- TODO nao sei se vou usar
--   require("buffers_utils").close_buffer(true) -- Força o fechamento de todos os buffers (ignora modificações).
-- end, { desc = ":qa! >> SEM SALVAR Fechar todos os buffers (FORÇAR)" })

-- -----------------------------------------------------------------------------
-- Toggle Case (Maiúscula/Minúscula da palavra): atalho: C-S-m -------------------
local function toggle_word_case()
  local current_word = vim.fn.expand("<cword>")
  if current_word == nil or current_word == "" then
    return "<Nop>"
  end
  if current_word:upper() == current_word then
    return "viwu" -- Se maiúscula, torna minúscula.
  else
    return "viwU" -- Se minúscula/misto, torna maiúscula.
  end
end
vim.keymap.set("n", "<C-mm>", toggle_word_case(), { expr = true, desc = "Alternar case da palavra - neural: mm = maiusculo-minusculo" })
vim.keymap.set("i", "<C-mm>", "<Esc>" .. toggle_word_case() .. "a", { expr = true, desc = "Alternar case da palavra (Insert) - neural: mm = maiusculo-minusculo" })
-- -----------------------------------------------------------------------------

