-- @file: lua/custom/git_dashboard.lua

local M = {}

--- run_git_command
-- mission: Executa um comando git e retorna a saída.
-- args: command (string)
local function run_git_command(command)
    local success, output = pcall(vim.fn.system, 'git ' .. command)
    if not success or vim.v.shell_error ~= 0 then
        print('Erro ao executar o comando git: ' .. command)
        return nil
    end
    return vim.trim(output)
end

--- get_current_branch
-- mission: Obtém o nome da branch atual.
-- args: none
local function get_current_branch()
    return run_git_command('rev-parse --abbrev-ref HEAD')
end

--- show_dashboard
-- mission: Exibe um dashboard básico do Git com status e branch atual.
-- args: none
function M.show_dashboard()
    local branch = get_current_branch()
    if not branch then
        print("Erro: Não foi possível obter a branch atual. Verifique se você está em um repositório git e se o 'git' está no seu PATH.")
        return
    end

    local status = run_git_command('status --short')
    print("---------------------------------------")
    print("           Git Dashboard")
    print("---------------------------------------")
    print("Branch: " .. branch)
    print("---------------------------------------")
    print("Status:")
    if status and status ~= "" then
        print(status)
    else
        print("Nada para commitar, diretório de trabalho limpo.")
    end
    print("---------------------------------------")
end

--- add_commit
-- mission: Adiciona todas as mudanças e commita com uma mensagem.
-- args: none
function M.add_commit()
    local commit_msg = vim.fn.input("Mensagem do commit: ")
    if commit_msg == "" then
        print("Operação cancelada.")
        return
    end

    run_git_command('add .')
    run_git_command('commit -m "' .. commit_msg .. '"')
    print("Mudanças adicionadas e commitadas.")
end

--- push
-- mission: Envia as mudanças para o repositório remoto.
-- args: none
function M.push()
    run_git_command('push')
    print("Mudanças enviadas para o repositório remoto.")
end

--- pull
-- mission: Puxa as mudanças do repositório remoto.
-- args: none
function M.pull()
    run_git_command('pull')
    print("Mudanças puxadas do repositório remoto.")
end

--- run_custom_script
-- mission: Executa um script personalizado do git.
-- args: script_name (string)
function M.run_custom_script(script_name)
    run_git_command('exec ' .. script_name)
    print("Script executado: " .. script_name)
end

return M
