-- @file: lua/core/init.lua

local M = {}

function M.setup()
  local gemini = require("core.gemini")
  
  vim.api.nvim_create_user_command("GeminiPrompt", gemini.generate_from_prompt, { nargs = 0, desc = "Gerar conteudo com Gemini a partir de um prompt" })
  vim.api.nvim_create_user_command("GeminiCode", gemini.generate_from_code, { nargs = 0, desc = "Gerar conteudo com Gemini a partir de um bloco de codigo" })

  vim.api.nvim_echo({{"Comandos :GeminiPrompt e :GeminiCode carregados com sucesso!", "MoreMsg"}}, true, {})
end

return M