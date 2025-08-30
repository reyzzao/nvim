-- @file: ~/.config/nvim/lua/config/keymaps.lua

-- Missao: Carregar todos os arquivos de mapeamentos da pasta lua/keymaps.
-- Garante que os modulos em 'lua/' possam ser encontrados.

local function get_keymaps_path()
  return vim.fn.stdpath("config") .. "/lua/keymaps"
end

-- Adiciona o diretório 'lua' ao caminho de pesquisa de módulos.
-- Isso é necessário para que `require('utils.keymaps_helpers')` funcione
-- em qualquer arquivo de mapeamento.
vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/lua")

-- Funcao para carregar os arquivos de mapeamento
local function load_keymaps()
  local keymaps_path = get_keymaps_path()
  local keymaps_files = vim.fn.glob(keymaps_path .. "/*.lua", true, true)

  if not keymaps_files or #keymaps_files == 0 then
    vim.notify("Nenhum arquivo de mapeamento encontrado na pasta 'lua/keymaps'.", vim.log.levels.WARN)
    return
  end

  for _, file_path in ipairs(keymaps_files) do
    local file_name = vim.fn.fnamemodify(file_path, ":t:r")
    if file_name ~= "loader" then
      local module_name = "keymaps." .. file_name
      local ok, err = pcall(require, module_name)
      if not ok then
        vim.notify("Erro ao carregar o arquivo de mapeamentos " .. module_name .. ": " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

load_keymaps()