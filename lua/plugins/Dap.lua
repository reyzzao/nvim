-- @file: ~/.config/nvim/lua/plugins/Dap.lua
-- @mission: Configura o nvim-dap, nvim-dap-ui e nvim-dap-go para debugging em Go.

return {
  -- Plugin DAP principal
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Interface de UI para o DAP (altamente recomendado)
    'rcarriga/nvim-dap-ui', 
    -- Extensao para Go (configura automaticamente o Delve)
    'leoluz/nvim-dap-go',
    -- ESSENCIAL: Dependencia necessaria para o nvim-dap-ui
    'nvim-neotest/nvim-nio', 
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    
    -- 1. Configuracao da UI (janelas do debug)
    dapui.setup({
        -- Configurações de layout da UI, se necessário
        icons = { expanded = "▾", collapsed = "▸", current_frame = "烙" },
        layouts = {
            {
                elements = {
                    -- Ordem das janelas: Variaveis, Watch, Stack/Breakpoints
                    { id = "scopes", size = 0.30 },
                    { id = "breakpoints", size = 0.20 },
                    { id = "watches", size = 0.20 },
                    { id = "stacks", size = 0.30 },
                },
                size = 40, -- Largura da barra lateral de debug
                position = "right",
            },
            {
                elements = {
                    { id = "repl", size = 0.5 }, -- Terminal/REPL
                    { id = "console", size = 0.5 }, -- Output do programa
                },
                size = 10, -- Altura da janela inferior
                position = "bottom",
            },
        },
    })
    
    -- Autocmds para abrir/fechar a UI automaticamente
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    
    -- 2. Configuracao do Delve (usando nvim-dap-go)
    require('dap-go').setup()

    -- 3. Mapeamentos de Teclas para Debug
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Pontos de Parada (Breakpoints)
    map('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
    
    -- Iniciar Debug
    map('n', '<leader>dr', function()
      dap.run_to_cursor()
    end, { desc = 'Run to Cursor' })
    map('n', '<leader>dc', dap.continue, { desc = 'Continue/Start Debug' })

    -- Controles
    map('n', '<leader>dn', dap.step_over, { desc = 'Step Over (Next)' })
    map('n', '<leader>di', dap.step_into, { desc = 'Step Into' })
    map('n', '<leader>do', dap.step_out, { desc = 'Step Out' })
    map('n', '<leader>dt', dap.terminate, { desc = 'Terminate' })
    
    -- Visualizacao
    map('n', '<leader>dv', dapui.toggle, { desc = 'Toggle DAP UI' })
  end
}