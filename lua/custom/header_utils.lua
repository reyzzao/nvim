-- @file: lua/custom/header_utils.lua

-- Define o módulo header_utils
local M = {}

-- Tabela para mapear extensões de arquivo a seus prefixos e sufixos de comentário.
M.comment_syntax = {
  ['js'] = { prefix = '// ', suffix = '' },
  ['ts'] = { prefix = '// ', suffix = '' },
  ['tsx'] = { prefix = '// ', suffix = '' },
  ['jsx'] = { prefix = '// ', suffix = '' },
  ['py'] = { prefix = '# ', suffix = '' },
  ['sh'] = { prefix = '# ', suffix = '' },
  ['lua'] = { prefix = '-- ', suffix = '' },
  ['c'] = { prefix = '// ', suffix = '' },
  ['cpp'] = { prefix = '// ', suffix = '' },
  ['h'] = { prefix = '// ', suffix = '' },
  ['hpp'] = { prefix = '// ', suffix = '' },
  ['java'] = { prefix = '// ', suffix = '' },
  ['rs'] = { prefix = '// ', suffix = '' },
  ['go'] = { prefix = '// ', suffix = '' },
  ['html'] = { prefix = '<!-- ', suffix = ' -->' },
  ['css'] = { prefix = '/* ', suffix = ' */' },
  ['scss'] = { prefix = '// ', suffix = '' },
  ['json'] = { prefix = '// ', suffix = '' }, -- JSON não suporta comentários, mas mantém a consistência.
}

--- @mission: Determina o prefixo e sufixo de comentário com base na extensão do arquivo.
-- @args: 'file_name' (string) é o nome completo do arquivo (ex: 'main.lua').
-- @return: 'table' com as chaves 'prefix' e 'suffix'. Ex: {prefix = '-- ', suffix = ''}
function M.get_filetype_comment(file_name)
  local extension = vim.fn.fnamemodify(file_name, ':e')
  local syntax = M.comment_syntax[extension]
  if syntax then
    return syntax
  else
    -- Retorna um padrão seguro caso a extensão não seja mapeada.
    return { prefix = '-- ', suffix = '' }
  end
end

--- Insere um cabeçalho de arquivo no início do buffer.
-- @mission: Cria e insere um cabeçalho padronizado no topo do arquivo. Se o buffer não tiver um nome de arquivo, ele usará um nome genérico. Se um cabeçalho já existir e 'force' for falso, ele não fará nada.
-- @args: 'opts' (table) contém as opções passadas ao comando, como 'bang' para forçar a inserção.
function M.insert_header(opts)
  -- Pega o caminho do arquivo do buffer atual.
  local file_path = vim.fn.expand('%:p')
  local file_name = vim.fn.fnamemodify(file_path, ':t')
  if file_name == '' then
    file_name = 'Novo Arquivo'
  end

  -- Obtém o prefixo e sufixo de comentário corretos.
  local comment_syntax = M.get_filetype_comment(file_name)
  local prefix = comment_syntax.prefix
  local suffix = comment_syntax.suffix

  -- Se já houver conteúdo no buffer e o comando não for forçado (!),
  -- avisa o usuário e não faz nada.
  local line_count = vim.api.nvim_buf_line_count(0)
  if line_count > 1 and not opts.bang then
    local first_line = vim.api.nvim_get_current_line()
    -- Normaliza o prefixo para a verificação de existência, escapando caracteres especiais.
    local check_prefix = prefix:gsub("[%-+*?.()]", "%%%1")
    if first_line and first_line:find("^" .. check_prefix .. "@file:") then
      vim.api.nvim_echo({{"Cabeçalho já existe. Use :InsertHeader! para forçar a inserção.", "WarningMsg"}}, true, {})
      return
    end
  end

  -- Formata o conteúdo do cabeçalho.
  local header_content = string.format("%s@file: %s%s\n\n", prefix, file_path, suffix)

  -- Insere o cabeçalho no topo do buffer.
  vim.api.nvim_buf_set_text(0, 0, 0, 0, 0, vim.split(header_content, '\n', {}))

  print("Cabeçalho inserido com sucesso!")
end

return M
