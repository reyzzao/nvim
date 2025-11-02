-- @file: ~/.config/nvim/lua/config/keymaps.lua
-- @mission: Define todos os mapeamentos de teclado do editor, utilizando as funções auxiliares em 'functions.lua' e configura nomes para os grupos no Which-key.

local map = vim.keymap.set
local log_info = vim.log.levels.INFO
local notify = vim.notify
local functions = require('config.functions')
local wk_ok, wk = pcall(require, "which-key") -- Tenta carregar o which-key para nomear os grupos

--- Mapeamentos de EDIÇÃO

map("n", "<leader>U", functions.toggle_case, { desc = "Alternar caixa da palavra" })
map("n", "<leader>xe", ':Ex<CR>', { desc = "explorer nativo netwr" })

map('n', '<C-Down>', 'yyP', { desc = 'Duplicar linha' })
map('v', '<C-Down>', 'yP', { desc = 'Duplicar seleção' })

--- Prefixo: leader + p (APENAS GRUPOS) e Comandos de Acao Imediata (RAIZ)
map('n', '<leader>h', functions.InsertHeader, { desc = 'Insere endereço relativo do arquivo.' }) -- Movido de <leader>ph
map('n', '<leader>m', ':messages<CR>', { desc = 'Mostra mensagens' }) -- Movido de <leader>pm

-- NOVO Atalho de Recarregar Configuração: <leader>rc
map("n", "<leader>rc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  notify("Configuração recarregada!", log_info)
end, { desc = "Recarregar config do Neovim (Reload Config)" }) -- Movido de <leader>prc

map('n', '<leader>k', ':qa!<CR>', { desc = 'Fechar Kill Neovim sem salvar nada abandona! #warning' })
map('n', '<leader>q', function()
  require('persistence').save()
  vim.cmd('qa!')
end, { desc = 'Fechar o Neovim e salvar sessao com :qa!' })
-- NOVO MAPA: Ver Snippets Disponíveis
vim.keymap.set('n', '<leader>pls', '<cmd>LuaSnipListAvailable<CR>', { desc = 'Mostra Lista de Snippets' })

-- BLOCO DE GRUPO: Atalhos de Debugger (Prefixado com <leader>pd)
map('n', '<leader>pd', '<cmd>DapUiToggle<CR>', { desc = 'Debug: Alternar UI do DAP' })
map('n', '<leader>pdt', '<cmd>DapTerminate<CR>', { desc = 'Debug: Terminar Sessão' })
map('n', '<leader>pdb', '<cmd>DapToggleBreakpoint<CR>', { desc = 'Debug: Adicionar/Remover Breakpoint' })
map('n', '<leader>pds', '<cmd>DapStepOver<CR>', { desc = 'Debug: Step Over (Próxima Linha)' })
map('n', '<leader>pdn', '<cmd>DapStepOut<CR>', { desc = 'Debug: Step Out (Sair da Função)' })
map('n', '<leader>pdi', '<cmd>DapStepInto<CR>', { desc = 'Debug: Step Into (Entrar na Função)' })
map('n', '<leader>pdc', '<cmd>DapContinue<CR>', { desc = 'Debug: Continuar Execução' })

--- -------------------------------------------

--- Mapeamentos de COPIAR/RECORTAR/COLAR  
map('n', '<leader>u', function() -- Movido de <leader>pu
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg('+', file_path)
  notify("Caminho do arquivo copiado!", log_info, { title = "Caminho Copiado" })
end, { desc = 'Copia caminho absoluto do arquivo' })


-- Mapeamento de SALVAR com verificacao de buffer
map({ 'n', 'i' }, '<C-s>', function()
  if vim.bo.buftype == '' and vim.bo.modifiable then
    vim.api.nvim_command('w')
    notify("Arquivo salvo!", log_info, { title = "Salvar" })
  else
    notify("Não é possível salvar este buffer.", vim.log.levels.WARN, { title = "Salvar" })
  end
end, { desc = 'Salvar arquivo' })

-- edicao --
map('n', 'yy', '"+yy', { desc = "Copiar linha para o clipboard do sistema" })
map('n', 'p', '"+p', { desc = "Colar do clipboard do sistema" })
map('v', 'p', '"+p', { desc = "Colar do clipboard do sistema" })
  
map({ 'n', 'v' }, '<C-S-c>', '"+y', { desc = 'Copiar para o clipboard do sistema' })
map({ 'n', 'v' }, '<C-S-v>', '"+p', { desc = 'Colar do clipboard do sistema' })
map({ 'n', 'v' }, '<C-x>', '"+d', { desc = 'Recortar para o clipboard do sistema' })
map('n', '<C-a>', 'ggVG', { desc = 'Selecionar todo o conteúdo do arquivo' })

map('n', '<C-z>', 'u', { desc = 'Desfazer' })
map('i', '<C-z>', '<Esc>ui', { desc = 'Desfazer (modo inserção)' })

map('n', '<C-S-z>', '<C-r>', { desc = 'Refazer (VSCodium)' })
map('i', '<C-S-z>', '<Esc><C-r>i', { desc = 'Refazer (VSCodium - modo inserção)' })


--- linha
map('n', '<A-d>', 'dd', { desc = 'Deletar linha' })
map('i', '<A-d>', '<Esc>dd', { desc = 'Deletar linha' })
map('v', '<A-d>', 'd', { desc = 'Deletar linha' })
map('n', '<A-l>', 'V', { desc = 'Selecionar linha atual' })
map('i', '<A-l>', '<Esc>V', { desc = 'Selecionar linha atual (modo inserção)' })

-- Mover linha para cima e para baixo
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Mover linha para baixo" })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Mover linha para cima" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Mover bloco para baixo" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Mover bloco para cima" })

--- Mapeamentos de Movimentação
map('n', '<C-Home>', 'gg', { desc = 'Ir para o inicio do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })
map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-w>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-q>', ':qa<CR>', { desc = 'Fechar TODOS os buffers/janelas e kill editor' })
-- resize
map('n', '<S-k>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
map('n', '<S-j>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
map('n', '<S-l>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela' })
map('n', '<S-h>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela' })
-- identacao
map({ 'n', 'v' }, '<A-Right>', '>>', { desc = 'Indentar para direita' })
map({ 'n', 'v' }, '<A-Left>', '<<', { desc = 'Indentar para esquerda' })
map('i', '<C-Right>', '<Esc>>>a', { desc = 'Indentar para direita (modo inserção)' })
map('i', '<C-Left>', '<Esc><<a', { desc = 'Indentar para esquerda (modo inserção)' })

--- Mapeamentos de LSP e Formatação
map('n', '<leader>li', vim.lsp.buf.hover, { desc = 'LSP: Mostra info de artefatos' })
map('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Ir para definição' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: Ir para declaração' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'LSP: Ir para referências' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP: Ir para implementação' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Inspecionar Hover' })

map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'LSP: Renomear símbolo' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: Code Action' })
map({ "n", "v" }, "<leader>f", function()
    vim.lsp.buf.format()
    notify("Arquivo formatado!", log_info, { title = "Formatar" })
end, { desc = "Formatar arquivo" })

--- Mapeamento de Terminal vsplit lateral 
map('n', '<A-t>', functions.toggle_vsplit_terminal, { desc = 'Alternar Terminal em Vsplit' })


--- Mapeamentos do Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Encontrar arquivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Busca por string" })
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Pesquisar no arquivo atual" })
map("n", "<C-g><C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Pesquisar no projeto (Live Grep)" })
map("n", "<leader>R", function()
  local word = vim.fn.expand("<cword>")
  if word ~= nil and word ~= "" then
    require("telescope.builtin").live_grep({
      search_terms = { word },
    })
  else
    require("telescope.builtin").live_grep()
  end
end, { desc = "Busca para substituição global" })

--- Mapeamentos para navegar entre buffers e tabs
map("n", "<C-Right>", ":bnext<CR>", { desc = "Próximo buffer" })
map("n", "<C-Left>", ":bprevious<CR>", { desc = "Buffer anterior" })
map("n", "<C-S-Right>", ":tabnext<CR>", { desc = "Próxima tab" })
map("n", "<C-S-Left>", ":tabprevious<CR>", { desc = "Tab anterior" })


-- --- Maps IA Gemini
-- Mapeamento para abrir um prompt para o Gemini em modo normal >> plugin gen.nvim
vim.keymap.set("n", "<C-i>", "<cmd>lua require('gen').prompt_buffer()<CR>", { desc = "Gen: Abrir prompt para AI" })
vim.keymap.set("v", "<C-k>", "<cmd>lua require('gen').prompt_visual()<CR>", { desc = "Gen: Usar selecao como prompt" })

-- abrevicoes rapidas funcionando - configurar: após iabbrev a proxima sera a chave e a proxima sera a inserçao
-- uso: ao digitar a chave dê espaço que a abrevicao sera inserida.
-- todo: só nao consegui ainda pular a linha no etxto inserido mesmo add \n .
vim.cmd("iabbrev chave1 mostra a abreviacao: chave1")
vim.cmd("iabbrev chave2 mostra a abreviacao: chave2")
vim.cmd("iabbrev soma_raiz function sum(num1, num2) {\\n  return num1 + num2;\\n}")

-- Seleção com Shift e Setas
map("n", "<S-Up>", "V", { desc = "Selecionar linha" })
map("n", "<S-Down>", "V", { desc = "Selecionar linha" })
map("n", "<S-Left>", "v", { desc = "Selecionar caractere" })
map("n", "<S-Right>", "v", { desc = "Selecionar caractere" })

map("v", "<S-Up>", ":<C-u>normal! ^k<CR>", { desc = "Selecionar para cima" })
map("v", "<S-Down>", ":<C-u>normal! ^j<CR>", { desc = "Selecionar para baixo" })
map("v", "<S-Left>", "<left>", { desc = "Selecionar para esquerda" })
map("v", "<S-Right>", "<right>", { desc = "Selecionar para direita" })

--- Maps IA Gemini
vim.keymap.set("n", "<leader>ai", function()
    local gemini = require("gemini")
    vim.ui.input({ prompt = "Consulta para o Gemini: " }, function(query)
        if not query or #query == 0 then
            return
        end
        vim.notify("Gerando resposta... Aguarde...", vim.log.levels.INFO, { title = "Gemini.nvim" })
        local response = gemini.prompt(query)
        if response and response.result and response.result.candidates and response.result.candidates[1] then
            local text = response.result.candidates[1].content.parts[1].text
            vim.api.nvim_buf_set_lines(0, vim.api.nvim_buf_line_count(0), -1, false, { " ", "-- Resposta do Gemini:", " ", text })
            vim.notify("Resposta gerada!", vim.log.levels.INFO, { title = "Gemini.nvim" })
        else
            vim.notify("Erro ao gerar resposta.", vim.log.levels.ERROR, { title = "Gemini.nvim" })
        end
    end)
end, { desc = "Gemini: Pergunta com contexto do arquivo" })


-- #######################################################
-- BLOCO WHICH-KEY: NOMEIA OS GRUPOS DE ATALHOS
-- #######################################################

if wk_ok then
  -- Define o nome do grupo principal do projeto
  wk.add({
    { "<leader>p", group = "Projeto: Debug, Snippets, Ferramentas" },
  })

  -- Define o nome do subgrupo de Debugger (p + d)
  wk.add({
    { "<leader>pd", group = "Debugger (DAP)" },
  })
  
  -- Define o nome do subgrupo de Snippets (p + l)
  wk.add({
    { "<leader>pl", group = "LuaSnip (Snippets)" },
  })
  
  -- Define o nome para o grupo do <leader>k (Kill/Fechar)
  wk.add({
    { "<leader>k", group = "Fechar (Kill)" },
  })
  
  -- Define o nome para o grupo do <leader>f (Formatar/Telescope Find)
  wk.add({
    { "<leader>f", group = "Busca/Formatar" },
  })

  -- Define o nome para o grupo do <leader>r (LSP Rename/Telescope Replace)
  wk.add({
    { "<leader>r", group = "Renomear/Substituir" },
  })
  
  -- Define o nome para o grupo do <leader>rc (Reload Config)
  wk.add({
    { "<leader>r", group = "Recarregar Config" },
  })
end