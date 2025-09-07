-- @file: ~/.config/nvim/lua/config/keymaps.lua
-- @mission: Define todos os mapeamentos de teclado do editor, utilizando as funções auxiliares em 'functions.lua'.

local map = vim.keymap.set
local log_info = vim.log.levels.INFO
local notify = vim.notify
local functions = require('config.functions')

--- Mapeamentos de EDIÇÃO

map("n", "<leader>U", functions.toggle_case, { desc = "Alternar caixa da palavra" })
map("n", "<leader>xe", ':Ex<CR>', { desc = "explorer nativo netwr" })

map('n', '<C-Down>', 'yyP', { desc = 'Duplicar linha' })
map('v', '<C-Down>', 'yP', { desc = 'Duplicar seleção' })

--- Prefixo: leader + p
map('n', '<leader>ph', functions.InsertHeader, { desc = 'Insere endereço relativo do arquivo.' })
map('n', '<leader>pm', ':messages<CR>', { desc = 'Mostra mensagens' })
map("n", "<leader>prc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  notify("Configuração recarregada!", log_info)
end, { desc = "Recarregar config do Neovim" })
map('n', '<leader>k', ':qa!<CR>', { desc = 'Fechar Kill Neovim sem salvar nada abandona!obs: auto save ligado vai salvar msm assim! #warning' })
map('n', '<leader>q', function()
  require('persistence').save()
  vim.cmd('qa!')
end, { desc = 'Fechar o Neovim e salvar sessao com :qa!' })

--- Mapeamentos de COPIAR/RECORTAR/COLAR
map('n', '<leader>pc', function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg('+', file_path)
  notify("Caminho do arquivo copiado!", log_info, { title = "Caminho Copiado" })
end, { desc = 'Copia caminho absoluto completo do arquivo' })


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
map('n', 'yy', '"+yy', { desc = "Copiar linha para o clipboard" })
map('n', 'p', '"+p', { desc = "Colar do clipboard do sistema" })
map('v', 'p', '"+p', { desc = "Colar do clipboard do sistema" })
  
map({ 'n', 'v' }, '<C-S-c>', '"+y', { desc = 'Copiar para o clipboard do sistema' })
map({ 'n', 'v' }, '<C-S-v>', '"+p', { desc = 'Colar do clipboard do sistema' })
map({ 'n', 'v' }, '<C-x>', '"+d', { desc = 'Recortar para o clipboard do sistema' })

map('n', '<C-z>', 'u', { desc = 'Desfazer' })
map('i', '<C-z>', '<Esc>ui', { desc = 'Desfazer (modo inserção)' })
map('n', '<C-r>', '<C-r>', { desc = 'Refazer' })
map('i', '<C-r>', '<Esc><C-r>i', { desc = 'Refazer (modo inserção)' })
map('n', '<C-a>', 'ggVG', { desc = 'Selecionar todo o conteúdo do arquivo' })

--- linha
map('n', '<A-d>', 'dd', { desc = 'Deletar linha' })
map('i', '<A-d>', '<Esc>dd', { desc = 'Deletar linha' })
map('v', '<A-d>', 'd', { desc = 'Deletar linha' })
map('n', '<A-l>', 'V', { desc = 'Selecionar linha atual' })
map('i', '<A-l>', '<Esc>V', { desc = 'Selecionar linha atual (modo inserção)' })

--- Mapeamentos de Movimentação
map('n', '<C-Home>', 'gg', { desc = 'Ir para o inicio do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })
map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-q>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-w>', ':qa<CR>', { desc = 'Fechar todos os buffers/janelas' })
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


--- Maps IA Gemini
map({ 'n' }, '<leader>pG', ':GeminiPrompt<CR>', { desc = 'Prompt Gemini' })
map({ 'v' }, '<leader>pg', ':GeminiCode<CR>', { desc = 'Gerar com Codigo' })

-- abrevicoes rapidas funcionando - configurar: após iabbrev a proxima sera a chave e a proxima sera a inserçao
-- uso: ao digitar a chave dê espaço que a abrevicao sera inserida.
-- todo: só nao consegui ainda pular a linha no etxto inserido mesmo add \n .
vim.cmd("iabbrev chave1 mostra a abreviacao: chave1")
vim.cmd("iabbrev chave2 mostra a abreviacao: chave2")
vim.cmd("iabbrev soma_raiz function sum(num1, num2) {\\n  return num1 + num2;\\n}")