-- @file: lua/custom/header_create.lua

-- Este arquivo não retorna uma tabela. Ele executa a lógica diretamente.

-- Tenta carregar o módulo custom.header_utils de forma segura.
local ok, header_utils = pcall(require, 'custom.header_utils')

if ok then
  -- Cria o comando de usuário apenas se o módulo foi carregado com sucesso.
  vim.api.nvim_create_user_command(
    'InsertHeader',
    header_utils.insert_header,
    {
      desc = 'Insere o cabeçalho do arquivo no início do buffer.',
      bang = true, -- Permite o uso de "!" para forçar a inserção.
    }
  )
else
  -- Caso o módulo não seja encontrado, exibe uma mensagem de erro clara.
  vim.api.nvim_echo({
    {'Erro: O módulo "custom.header_utils" não foi encontrado.', 'ErrorMsg'},
    {'Verifique o caminho do arquivo.', 'WarningMsg'}
  }, true, {})
end
