-- lua/custom/utils/loader.lua
local M = {}

--- Carrega todos os módulos Lua de um diretório especificado.
-- @param path_from_custom string O caminho do diretório, relativo à pasta 'lua/custom/' do seu Neovim.
--                              Ex: 'plugins', 'keymaps', 'core/settings'
function M.load_directory(path_from_custom)
    local full_path = vim.fn.stdpath('config') .. '/lua/custom/' .. path_from_custom
    local success, files = pcall(vim.fn.readdir, full_path)

    if not success or not files then
        print(string.format("Nenhum arquivo encontrado ou erro ao ler o diretório: %s", full_path))
        return
    end

    table.sort(files)

    for _, filename in ipairs(files) do
        if filename:match("%.lua$") and vim.fn.filereadable(full_path .. '/' .. filename) == 1 then
            -- O nome do módulo agora começa com ''
            local module_name = '' .. path_from_custom:gsub("/", ".") .. "." .. filename:gsub("%.lua$", "")
            local ok, err = pcall(require, module_name)
            if not ok then
                vim.api.nvim_err_writeln(string.format("Erro ao carregar %s: %s", module_name, err))
            end
        end
    end
end

return M