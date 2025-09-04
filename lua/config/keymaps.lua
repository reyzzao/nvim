-- @file: ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local log_info = vim.log.levels.INFO
local notify = vim.notify

--- Mapeamentos de EDIÇÃO

-- Atalho para alternar a caixa da palavra
local toggle_case = function()
  local current_word = vim.fn.expand("<cword>")
  if current_word == nil or current_word == "" then
    return
  end
  local first_char = current_word:sub(1, 1)
  local new_word
  if first_char == first_char:upper() then
    new_word = current_word:lower()
  else
    new_word = current_word:upper()
  end
  vim.api.nvim_command("normal! ciw" .. new_word)
end
map("n", "<leader>U", toggle_case, { desc = "Alternar caixa da palavra" })

--- Prefixo: leader + p
map('n', '<leader>ph', ':InsertHeader<CR>', { desc = 'Insere endereço relativo do arquivo.' })
map('n', '<leader>pm', ':messages<CR>', { desc = 'Mostra mensagens' })
map("n", "<leader>prc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  notify("Configuração recarregada!", log_info)
end, { desc = "Recarregar config do Neovim" })
map('n', '<leader>k', ':confirm q<CR>', { desc = 'Fechar Kill Neovim (com confirmação)' })
map('n', '<leader>q', function()
  require('persistence').save()
  vim.cmd('qa!')
end, { desc = 'Fechar o Neovim e salvar sessao com :qa!' })

--- Mapeamentos de COPIAR/RECORTAR/COLAR
map('n', '<leader>pc', function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg('+', file_path)
  notify("Caminho do arquivo copiado!", log_info, { title = "Caminho Copiado" })
end, { desc = 'Copiar caminho completo do arquivo' })
map({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copiar para o clipboard do sistema' })
map({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Colar do clipboard do sistema' })
map({ 'n', 'v' }, '<C-x>', '"+d', { desc = 'Recortar para o clipboard do sistema' })

-- Mapeamento de SALVAR com verificacao de buffer
map({ 'n', 'i' }, '<C-s>', function()
  if vim.bo.buftype == '' and vim.bo.modifiable then
    vim.api.nvim_command('w')
    notify("Arquivo salvo!", log_info, { title = "Salvar" })
  else
    notify("Não é possível salvar este buffer.", vim.log.levels.WARN, { title = "Salvar" })
  end
end, { desc = 'Salvar arquivo' })

--- Mapeamentos de UNDO/REDO/Selecao
map('n', '<C-z>', 'u', { desc = 'Desfazer' })
map('i', '<C-z>', '<Esc>ui', { desc = 'Desfazer (modo inserção)' })
map('n', '<C-r>', '<C-r>', { desc = 'Refazer' })
map('i', '<C-r>', '<Esc><C-r>i', { desc = 'Refazer (modo inserção)' })
map('n', '<C-a>', 'ggVG', { desc = 'Selecionar todo o conteúdo do arquivo' })
map('n', '<A-l>', 'V', { desc = 'Selecionar linha atual' })
map('i', '<A-l>', '<Esc>V', { desc = 'Selecionar linha atual (modo inserção)' })
map({ 'n', 'v' }, '<A-Right>', '>>', { desc = 'Indentar para direita' })
map({ 'n', 'v' }, '<A-Left>', '<<', { desc = 'Indentar para esquerda' })
map('i', '<C-Right>', '<Esc>>>a', { desc = 'Indentar para direita (modo inserção)' })
map('i', '<C-Left>', '<Esc><<a', { desc = 'Indentar para esquerda (modo inserção)' })
map({ 'n', 'v' }, '<C-Down>', 'yP', { desc = 'Duplicar linha/seleção' })

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

--- Mapeamento de Terminal
local function toggle_vsplit_terminal()
  local function find_terminal_buffer()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == 'terminal' then
        return buf
      end
    end
    return nil
  end
  local terminal_buf = find_terminal_buffer()
  if terminal_buf then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end
  vim.cmd('vsplit')
  vim.cmd('cd %:p:h')
  vim.cmd('terminal')
  vim.cmd('startinsert')
end
map('n', '<A-t>', toggle_vsplit_terminal, { desc = 'Alternar Terminal em Vsplit' })

--- Mapeamentos de Movimentação
map('n', '<A-k>', ':m .+1<CR>==', { desc = 'Mover linha para baixo' })
map('n', '<A-j>', ':m .-2<CR>==', { desc = 'Mover linha para cima' })
map('v', '<A-k>', ":m '>+1<CR>gv=gv", { desc = 'Mover selecao para baixo' })
map('v', '<A-j>', ":m '<-2<CR>gv=gv", { desc = 'Mover selecao para cima' })
map('i', '<A-k>', '<Esc>:m .+1<CR>==gi', { desc = 'Mover linha para baixo (insercao)' })
map('i', '<A-j>', '<Esc>:m .-2<CR>==gi', { desc = 'Mover linha para cima (insercao)' })
map('n', '<C-Home>', 'gg', { desc = 'Ir para o inicio do arquivo' })
map('n', '<C-End>', 'G', { desc = 'Ir para o fim do arquivo' })
map('n', '<C-w><C-w>', '<C-w><C-w>', { desc = 'Navegar entre janelas' })
map('n', '<A-q>', ':bd<CR>', { desc = 'Fechar buffer (janela) em foco' })
map('n', '<A-w>', ':qa<CR>', { desc = 'Fechar todos os buffers/janelas' })
map('n', '<A-S-k>', ':resize -2<CR>', { desc = 'Diminuir altura da janela' })
map('n', '<A-S-j>', ':resize +2<CR>', { desc = 'Aumentar altura da janela' })
map('n', '<A-S-l>', ':vertical resize -2<CR>', { desc = 'Diminuir largura da janela' })
map('n', '<A-S-h>', ':vertical resize +2<CR>', { desc = 'Aumentar largura da janela' })

--- Mapeamentos do Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Encontrar arquivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Busca por string" })
map("n", "<leader>eo", "<cmd>Telescope find_files<cr>", { desc = "Buscar arquivos (Telescope)" })
map("n", "<leader>ef", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Pesquisar no arquivo atual" })
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

--- Mapeamento para ir para a definição com o mouse
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspMouseMaps', { clear = true }),
  callback = function(args)
    vim.keymap.set('n', '<LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = args.buf, desc = 'Ir para a definição (mouse)' })
  end,
})

--- Maps IA Gemini
map({ 'n' }, '<leader>pG', ':GeminiPrompt<CR>', { desc = 'Prompt Gemini' })
map({ 'v' }, '<leader>pg', ':GeminiCode<CR>', { desc = 'Gerar com Codigo' })