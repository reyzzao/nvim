-- @file: lua/custom/create_file.lua

local M = {}

--- get_file_type_comment_prefix
-- mission: Determina o prefixo de comentário com base na extensão do arquivo.
-- args: file_path (string)
-- returns: string
local function get_file_type_comment_prefix(file_path)
    local file_extension = file_path:match("%.([^/\\%.]+)$")
    local prefixes = {
        ['lua'] = '--',
        ['js'] = '//',
        ['ts'] = '//',
        ['py'] = '#',
        ['sh'] = '#',
        ['json'] = '//' -- JSON não suporta comentários, mas é uma boa prática documentar
    }
    return prefixes[file_extension] or '--'
end

--- create_new_file
-- mission: Solicita um nome de arquivo e o cria com um cabeçalho.
-- args: none
function M.create_new_file()
    local file_path = vim.fn.input("Nome do novo arquivo (ex: src/MyComponent.js): ")
    if file_path == "" then
        print("Criação de arquivo cancelada.")
        return
    end

    local full_path = vim.fn.expand(vim.fn.getcwd() .. "/" .. file_path)
    local dir = vim.fn.fnamemodify(full_path, ":h")

    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
        print("Diretório criado: " .. dir)
    end

    local comment_prefix = get_file_type_comment_prefix(file_path)
    local header_content = comment_prefix .. " @file: " .. file_path

    local file = io.open(full_path, "w")
    if file then
        file:write(header_content .. "\n\n")
        file:close()
        print("Arquivo criado: " .. full_path)
        vim.cmd("edit " .. full_path)
    else
        print("Erro: Não foi possível criar o arquivo em " .. full_path)
    end
end

return M
