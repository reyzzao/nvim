-- @file: ~/.config/nvim/lua/custom/GlobalRename.lua
-- @package: custom.GlobalRename

local M = {}

-- @function: globalRename
-- @mission: Pega a palavra sob o cursor, solicita termos e executa a substituicao global.
M.globalRename = function()
  local searchTerm = vim.fn.expand("<cword>")
  local replaceTerm

  if searchTerm == "" then
    print("Nenhuma palavra sob o cursor. Digite a palavra no prompt.")
  end

  vim.ui.input({ prompt = "Buscar por: ", default = searchTerm }, function(input)
    if not input then
      print("Busca cancelada.")
      return
    end
    searchTerm = input

    vim.ui.input({ prompt = "Substituir por: " }, function(output)
      if not output then
        print("Substituicao cancelada.")
        return
      end
      replaceTerm = output

      -- Escapa os termos para uso em regex e no shell
      local escaped_search = vim.fn.escape(searchTerm, "/\\")
      local escaped_replace = vim.fn.escape(replaceTerm, "/\\")
      local shell_safe_search = vim.fn.fnameescape(searchTerm)

      -- Usa ripgrep para obter uma lista de arquivos e a define como 'arglist'
      local files = vim.fn.systemlist("rg --files-with-matches " .. shell_safe_search)
      
      -- Adiciona um print para depuracao
      print("Arquivos encontrados pelo ripgrep:")
      for _, file in ipairs(files) do
        print(file)
      end
      
      if #files == 0 then
        print("Nenhum arquivo encontrado para a substituicao.")
        return
      end

      -- Adiciona arquivos a 'arglist'
      vim.cmd("argadd " .. table.concat(files, " "))
      
      -- Adiciona o arquivo atual a 'arglist'
      vim.cmd("argadd %")
      
      -- Executa a substituicao
      local cmd = string.format("argdo s/%s/%s/gce | update", escaped_search, escaped_replace)
      vim.cmd(cmd)

      -- Limpa a lista de argumentos
      vim.cmd("argdelete *")

      print("Substituicao global concluida. Verifique os arquivos modificados.")
    end)
  end)
end

-- @command: GlobalRenameCommand
-- @mission: Define o comando de usuario para a funcao
vim.api.nvim_create_user_command(
  "GlobalRename",
  M.globalRename,
  { nargs = 0, desc = "Executa substituicao global em multiplos arquivos usando 'ripgrep'." }
)

return M
