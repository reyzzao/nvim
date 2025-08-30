-- @file: lua/core/init.lua

--- Missao: Carregar nossa funcao personalizada para o Gemini e criar um comando de usuario.
local M = {}

--- Missao: Cria o comando de usuario `:Gemini`.
-- @args: nenhum.
function M.setup()
  local gemini_prompt = require("core.gemini")

  vim.api.nvim_create_user_command("Gemini", function(opts)
    -- Missao: Executar o prompt do Gemini com a opcao de inserir no cursor.
    -- @args:
    -- - opts: tabela de opcoes do comando.
    if not opts.args or #opts.args == 0 then
      vim.api.nvim_echo({{"Erro: Nenhum prompt fornecido.", "Error"}}, true, {})
      return
    end
    gemini_prompt(opts.args, true)
  end, { nargs = "*", complete = "file" })

  vim.api.nvim_echo({{"Comando :Gemini carregado com sucesso!", "MoreMsg"}}, true, {})
end

return M
