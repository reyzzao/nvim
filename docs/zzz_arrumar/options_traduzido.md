
---

-- local function vim_options()
  -- {
    -- options by vimscript in vim.opt

    -- local function options = {


      -- Garante a codificação de caracteres UTF-8 para o editor e arquivos.
      vim.opt.encoding = "utf-8"
      -- Garante que arquivos sejam salvos com codificação UTF-8.
      vim.opt.fileencoding = "utf-8"
      -- Habilita o uso do mouse em todos os modos, permitindo clicar para mover o cursor, redimensionar janelas, etc.
      vim.opt.mouse = "a"
      -- Ativa o realce de sintaxe para melhor leitura do código.
      vim.opt.syntax = "on"

      -- Aparência e UI
      -- Exibe números de linha absolutos à esquerda do buffer.
      vim.opt.number = true
      -- Exibe números de linha relativos à linha do cursor, facilitando navegação com comandos de movimento do Vim (ex: '5j').
      vim.opt.relativenumber = true
      -- Habilita cores verdadeiras (24-bit True Color) no terminal para cores de colorschemes mais ricas.
      vim.opt.termguicolors = true
      -- Garante que a coluna de sinais (onde plugins como LSP e Gitsigns mostram ícones) esteja sempre visível, evitando que o texto "pule".
      vim.opt.signcolumn = "yes"
      -- Define a altura da linha de comando na parte inferior da tela para 1 linha, otimizando o espaço vertical.
      vim.opt.cmdheight = 1

      -- Edição de Texto
      -- Define o número de espaços que um caractere de tabulação representa.
      vim.opt.tabstop = 2
      -- Define o número de espaços para uma única indentação (usado por auto-indentação, '>>', '<<').
      vim.opt.shiftwidth = 2
      -- Converte caracteres de tabulação digitados em espaços, mantendo a consistência da indentação.
      vim.opt.expandtab = true
      -- Copia automaticamente a indentação da linha anterior para a nova linha.
      vim.opt.autoindent = true
      -- Fornece indentação inteligente para estruturas de código comuns (ex: blocos '{}').
      vim.opt.smartindent = true
      -- Desativa a quebra de linha automática para linhas longas, permitindo rolagem horizontal.
      vim.opt.wrap = false
      -- Se 'wrap' for true, quebra as linhas em palavras ou caracteres inteiros, não no meio.
      vim.opt.linebreak = true
      -- Caractere exibido para indicar que uma linha foi quebrada visualmente (se 'wrap' for true).
      vim.opt.showbreak = "↳ "

      -- Busca
      -- Ignora maiúsculas e minúsculas ao realizar buscas.
      vim.opt.ignorecase = true
      -- Se 'ignorecase' for true, torna a busca case-sensitive se houver um caractere maiúsculo no padrão de busca.
      vim.opt.smartcase = true
      -- Realça todos os resultados da última busca.
      vim.opt.hlsearch = true
      -- Realça os resultados da busca incrementalmente conforme você digita o padrão.
      vim.opt.incsearch = true
      -- Garante um número mínimo de linhas visíveis acima e abaixo do cursor, mantendo o contexto ao rolar.
      vim.opt.scrolloff = 8

      -- Sistema e Produtividade
      -- Persiste o histórico de "undo" entre as sessões, permitindo desfazer alterações após fechar um arquivo.
      vim.opt.undofile = true
      -- Define o diretório onde os arquivos de histórico de undo são armazenados.
      vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo" -- Crie este diretório se não existir!
      -- Sincroniza o registrador padrão e o registrador '+' do Neovim com a área de transferência do sistema.
      vim.opt.clipboard = "unnamedplus"
      -- Desativa a criação de arquivos de swap (.swp), reduzindo arquivos temporários no projeto.
      vim.opt.swapfile = false
      -- Tempo (em ms) que o Neovim espera por uma sequência de mapeamentos de teclas, afetando a responsividade.
      vim.opt.timeoutlen = 500
      -- Tempo (em ms) para gravar swapfiles e disparar eventos 'CursorHold' (importante para LSP).
      vim.opt.updatetime = 300
      -- Define o número máximo de comandos armazenados no histórico do Neovim.
      vim.opt.history = 500
      -- Exibe uma coluna visual na largura especificada (ex: 80 colunas) para guias de código.
      vim.opt.colorcolumn = "80"
      -- Novas janelas horizontais são abertas abaixo da janela atual.
      vim.opt.splitbelow = true
      -- Novas janelas verticais são abertas à direita da janela atual.
      vim.opt.splitright = true
      -- Configura como o menu de autocompletar se comporta (ex: mostra menu, mas não seleciona automaticamente).
      vim.opt.completeopt = "menuone,noselect"



      -- Configuração do Colorscheme (não é uma opção vim.opt, mas é fundamental para a UI)
      -- Aplica o tema de cores escolhido ao iniciar o Neovim.
      -- vim.cmd.colorscheme "catppuccin-mocha" -- **Substitua pelo seu colorscheme preferido!**
    -- }

    -- obs: nao vou precisar iterar sob essas options porque add o obj vim.opt iria usar só se inseri-se codigo vimscript
    -- for key, val in pairs(options) do
    --   opt[key] = val
    -- end
--   },
-- }
-- end

---
