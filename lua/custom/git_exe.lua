-- @file: lua/custom/git_exe.lua

-- Carrega o módulo Git Dashboard
require('custom.git_dashboard')

-- Cria um comando para o dashboard
vim.cmd('command! GitDashboard lua require("custom.git_dashboard").show_dashboard()')

-- Mapeamentos de teclado para os comandos
vim.cmd('command! GitAddCommit lua require("custom.git_dashboard").add_commit()')
vim.cmd('command! GitPush lua require("custom.git_dashboard").push()')
vim.cmd('command! GitPull lua require("custom.git_dashboard").pull()')
vim.cmd('command! GitRunScript lua require("custom.git_dashboard").run_custom_script(vim.fn.input("Nome do script: "))')

-- Mapeamento para mudar de branch (requer fzf-lua ou similar para busca de branches)
vim.cmd('command! GitCheckout lua vim.cmd("!git checkout " .. vim.fn.input("Branch: "))')
