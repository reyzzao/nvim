-- -- @file: lua/config/init.lua

-- -- @mission: Configurar atalhos para refatoracao de codigo.
-- local M = {}

-- -- @function: SetupLSPRefactor
-- -- @mission: Configura o atalho para renomear simbolos com o LSP.
-- -- @description: Funcao que utiliza o Language Server Protocol para renomear variaveis
-- -- em todo o escopo do projeto, garantindo precisao.
-- local function SetupLSPRefactor()
--   local lsp_rename = function()
--     -- Renomeia a variavel sob o cursor usando a funcionalidade do LSP.
--     -- Esta funcao so funciona se o servidor de linguagem estiver anexado.
--     if vim.lsp.buf.get_clients() and vim.lsp.buf.has_capability('rename') then
--       vim.lsp.buf.rename()
--     else
--       vim.notify("LSP nao disponivel para renomear. Verifique sua configuracao.", vim.log.levels.WARN)
--     end
--   end

--   -- Mapeamento para refatoracao via LSP.
--   -- Usamos <leader>r para evitar conflito com o Telescope.
--   vim.keymap.set('n', '<leader>n', lsp_rename, { desc = 'Renomear Simbolo (LSP)' })
-- end

-- -- @mission: Chamar as funcoes de configuracao para habilitar as funcionalidades.
-- -- @description: Executa a funcao de setup para carregar os atalhos e comandos.
-- SetupLSPRefactor()

-- return M
