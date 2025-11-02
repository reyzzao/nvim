
---
 - Mais traduzidos: by Bibiano (https://github.com/reyzzao/wbackups/blob/main/nvim_modelos%2Fby_Dev_Jonatas_youtube%2Fnvim%2Flua%2Fcustom%2Fcore%2Fcommand.lua)
-- obs: JA COMECEI RECORTAR PRA USO

-- Defina como true se você tiver uma Nerd Font instalada e selecionada no terminal
vim.g.have_nerd_font = true

--- Opções de Configuração
-- Veja `:help vim.opt`
-- NOTA: Você pode alterar essas opções como desejar!

-- Define uma função de comando personalizada se quiser um atalho para ativar/desativar algo
  -- Isso não é uma "opção", mas um comando customizado.
  api.nvim_create_user_command("ToggleRelativeNumber", function()
    opt.relativenumber = not opt.relativenumber:get()
  end, { desc = "Toggle relative line numbers" })

  -- Define atalhos para comandos customizados, se quiser
  vim.keymap.set("n", "<leader>r", ":ToggleRelativeNumber<CR>", { desc = "Toggle relative line numbers" })

  -- Confirma que as opções foram carregadas
  vim.notify("Aviso: Opções básicas do Neovim configuradas!", vim.log.levels.INFO, { title = "Config" })
end



-- Mapeamentos de teclas de diagnóstico
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir para a mensagem de [D]iagnóstico anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir para a mensagem de [D]iagnóstico seguinte" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar mensagens de [E]rro de diagnóstico" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Abrir lista [Q]uickfix de diagnóstico" })



-- Sai do modo de terminal no terminal embutido com um atalho que é um pouco mais fácil
-- para as pessoas descobrirem. Caso contrário, você normalmente precisa pressionar <C-\><C-n>, o que
-- não é o que alguém adivinharia sem um pouco mais de experiência.
--
-- NOTA: Isso não funcionará em todos os emuladores de terminal/tmux/etc. Experimente seu próprio mapeamento
-- ou apenas use <C-\><C-n> para sair do modo de terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Sair do modo de terminal" })

-- DICA: Desabilite as teclas de seta no modo normal
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h para mover!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l para mover!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k para mover!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j para mover!!"<CR>')

-- Bindings de teclas para facilitar a navegação dividida.
-- Use CTRL+<hjkl> para alternar entre janelas
--
-- Veja `:help wincmd` para uma lista de todos os comandos de janela
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Mover foco para a janela esquerda" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Mover foco para a janela direita" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Mover foco para a janela de baixo" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Mover foco para a janela de cima" })

--- Autocomandos Básicos
-- Veja `:help lua-guide-autocommands`

-- Destaca ao copiar (yanking) texto
-- Experimente com `yap` no modo normal
-- Veja `:help vim.highlight.on_yank()`
--
-- TODO: está dando erro
-- vim.api.nvim_create_autocmd("TextYankPost", {
--  desc = "Destaca ao copiar (yanking) texto",
--  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
--  callback = function()
--    vim.highlight.on_yank()
--  end,
--})



--- Instalar o gerenciador de plugins `lazy.nvim`
-- Veja `:help lazy.nvim.txt` ou https://github.com/folke/lazy.nvim para mais informações
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--- Configurar e instalar plugins
-- Para verificar o status atual dos seus plugins, execute
--    :Lazy
--
-- Você pode pressionar `?` neste menu para ajuda. Use `:q` para fechar a janela
--
-- Para atualizar os plugins, você pode executar
--    :Lazy update
--
-- NOTA: Aqui é onde você instala seus plugins.
require("lazy").setup({
  -- NOTA: Plugins podem ser adicionados com um link (ou para um repositório github: link 'owner/repo').
  "tpope/vim-sleuth", -- Detecta tabstop e shiftwidth automaticamente
  "norcalli/nvim-colorizer.lua",

  -- NOTA: Plugins também podem ser adicionados usando uma tabela,
  -- com o primeiro argumento sendo o link e as seguintes
  -- chaves podem ser usadas para configurar o comportamento/carregamento do plugin, etc.
  --
  -- Use `opts = {}` para forçar um plugin a ser carregado.
  --
  -- Isso é equivalente a:
  --    require('Comment').setup({})

  -- "gc" para comentar regiões/linhas visuais
  { "numToStr/Comment.nvim", opts = {} },

  -- Aqui está um exemplo mais avançado onde passamos a configuração
  -- opções para `gitsigns.nvim`. Isso é equivalente ao seguinte Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- Veja `:help gitsigns` para entender o que as chaves de configuração fazem
  { -- Adiciona sinais relacionados ao git na sarjeta, bem como utilitários para gerenciar mudanças
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- NOTA: Plugins podem ser configurados para executar código Lua quando são carregados.
  --
  -- Isso é frequentemente muito útil para agrupar configurações, bem como lidar com
  -- carregamento lento de plugins que não precisam ser carregados imediatamente na inicialização.
  --
  -- Por exemplo, na seguinte configuração, usamos:
  --  event = 'VimEnter'
  --
  -- que carrega o which-key antes de todos os elementos da UI serem carregados. Eventos podem ser
  -- eventos de autocomandos normais (`:help autocmd-events`).
  --
  -- Então, porque usamos a chave `config`, a configuração só é executada
  -- depois que o plugin foi carregado:
  --  config = function() ... end

  { -- Plugin útil para mostrar os keybinds pendentes.
    "folke/which-key.nvim",
    event = "VimEnter", -- Define o evento de carregamento como 'VimEnter'
    config = function() -- Esta é a função que é executada, APÓS o carregamento
      require("which-key").setup()

      -- Documenta as cadeias de teclas existentes
      require("which-key").add({
        { "<leader>c", group = "[C]ódigo" },
        { "<leader>d", group = "[D]ocumento" },
        { "<leader>r", group = "[R]enomear" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      })
    end,
  },

  -- NOTA: Plugins podem especificar dependências.
  --
  -- As dependências são especificações de plugins adequadas também - qualquer coisa
  -- que você faz para um plugin no nível superior, você pode fazer para uma dependência.
  --
  -- Use a chave `dependencies` para especificar as dependências de um plugin específico

  { -- Fuzzy Finder (arquivos, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- Se encontrar erros, veja o README do telescope-fzf-native para instruções de instalação
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` é usado para executar algum comando quando o plugin é instalado/atualizado.
        -- Isso é executado apenas então, não toda vez que o Neovim inicia.
        build = "make",

        -- `cond` é uma condição usada para determinar se este plugin deve ser
        -- instalado e carregado.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },

      -- Útil para obter ícones bonitos, mas requer uma Nerd Font.
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope é um fuzzy finder que vem com muitas coisas diferentes que
      -- ele pode encontrar! É mais do que apenas um "localizador de arquivos", ele pode pesquisar
      -- muitos aspectos diferentes do Neovim, seu workspace, LSP e muito mais!
      --
      -- A maneira mais fácil de usar o Telescope é começar fazendo algo como:
      --  :Telescope help_tags
      --
      -- Depois de executar este comando, uma janela será aberta e você poderá
      -- digitar na janela de prompt. Você verá uma lista de opções de `help_tags` e
      -- uma pré-visualização correspondente da ajuda.
      --
      -- Duas keymaps importantes para usar no Telescope são:
      --  - Modo de inserção: <c-/>
      --  - Modo normal: ?
      --
      -- Isso abre uma janela que mostra todos os keymaps para o
      -- selecionador Telescope atual. Isso é realmente útil para descobrir o que o Telescope pode
      -- fazer e como realmente fazê-lo!

      -- Configurar Telescope
      -- Veja `:help telescope` e `:help telescope.setup()`
      require("telescope").setup({
        -- Você pode colocar seus mapeamentos padrão / atualizações / etc. aqui
        -- Todas as informações que você procura estão em `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      -- Habilita as extensões do Telescope se estiverem instaladas
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- Veja `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" }) -- [B]uscar [A]juda
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" }) -- [B]uscar [K]eymaps
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" }) -- [B]uscar [A]rquivos
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" }) -- [B]uscar [S]elecionar Telescope
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" }) -- [B]uscar [P]alavra atual
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" }) -- [B]uscar por [G]rep
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" }) -- [B]uscar [D]iagnósticos
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" }) -- [B]uscar [R]etomar
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' }) -- [B]uscar Arquivos Recentes ("." para repetir)
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Encontrar buffers existentes" })

      -- Exemplo ligeiramente avançado de como sobrescrever o comportamento e o tema padrão
      vim.keymap.set("n", "<leader>/", function()
        -- Você pode passar configuração adicional para o Telescope para mudar o tema, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Buscar difusamente no buffer atual" })

      -- Também é possível passar opções de configuração adicionais.
      -- Veja `:help telescope.builtin.live_grep()` para informações sobre chaves específicas
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep em Arquivos Abertos",
        })
      end, { desc = "[S]earch [/] em Arquivos Abertos" }) -- [B]uscar [/] em Arquivos Abertos

      -- Atalho para buscar seus arquivos de configuração do Neovim
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" }) -- [B]uscar arquivos do [N]eovim
    end,
  },

  { -- Configuração e Plugins LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Instala automaticamente LSPs e ferramentas relacionadas em stdpath para Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTA: Deve ser carregado antes dos dependentes
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Atualizações de status úteis para LSP.
      -- NOTA: `opts = {}` é o mesmo que chamar `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- `neodev` configura o LSP Lua para sua configuração, runtime e plugins do Neovim
      -- usado para preenchimento, anotações e assinaturas de APIs do Neovim
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- Breve aparte: **O que é LSP?**
      --
      -- LSP é um acrônimo que você provavelmente já ouviu, mas talvez não entenda o que é.
      --
      -- LSP significa Language Server Protocol. É um protocolo que ajuda editores
      -- e ferramentas de linguagem a se comunicarem de forma padronizada.
      --
      -- Em geral, você tem um "servidor" que é alguma ferramenta construída para entender uma determinada
      -- linguagem (como `gopls`, `lua_ls`, `rust_analyzer`, etc.). Esses Servidores de Linguagem
      -- (às vezes chamados de servidores LSP, mas isso é meio como "Máquina ATM") são processos
      -- autônomos que se comunicam com algum "cliente" - neste caso, o Neovim!
      --
      -- O LSP fornece ao Neovim recursos como:
      --  - Ir para definição
      --  - Encontrar referências
      --  - Autocompletar
      --  - Busca de símbolos
      --  - e muito mais!
      --
      -- Assim, os Servidores de Linguagem são ferramentas externas que devem ser instaladas separadamente
      -- do Neovim. É aqui que `mason` e plugins relacionados entram em jogo.
      --
      -- Se você está se perguntando sobre lsp vs treesitter, você pode verificar a seção de ajuda
      -- maravilhosamente e elegantemente composta, `:help lsp-vs-treesitter`

      -- Esta função é executada quando um LSP se conecta a um buffer específico.
      -- Ou seja, toda vez que um novo arquivo é aberto que está associado a
      -- um lsp (por exemplo, abrir `main.rs` está associado a `rust_analyzer`), esta
      -- função será executada para configurar o buffer atual
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          -- NOTA: Lembre-se que Lua é uma linguagem de programação real, e como tal é possível
          -- definir pequenas funções auxiliares e utilitárias para que você não precise se repetir.
          --
          -- Neste caso, criamos uma função que nos permite definir mapeamentos mais facilmente
          -- específicos para itens relacionados ao LSP. Ela define o modo, buffer e descrição para nós a cada vez.
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Pula para a definição da palavra sob o seu cursor.
          -- É onde uma variável foi declarada pela primeira vez, ou onde uma função é definida, etc.
          -- Para voltar, pressione <C-t>.
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

          -- Encontra referências para a palavra sob o seu cursor.
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

          -- Pula para a implementação da palavra sob o seu cursor.
          -- Útil quando sua linguagem tem maneiras de declarar tipos sem uma implementação real.
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

          -- Pula para o tipo da palavra sob o seu cursor.
          -- Útil quando você não tem certeza do tipo de uma variável e quer ver
          -- a definição do seu *tipo*, não onde ela foi *definida*.
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

          -- Encontra difusamente todos os símbolos no seu documento atual.
          -- Símbolos são coisas como variáveis, funções, tipos, etc.
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

          -- Encontra difusamente todos os símbolos no seu workspace atual.
          -- Semelhante aos símbolos do documento, mas busca em todo o seu projeto.
          map(
            "<leader>ws",
            require("telescope.builtin").lsp_dynamic_workspace_symbols,
            "[W]orkspace [S]ymbols"
          )

          -- Renomeia a variável sob o seu cursor.
          -- A maioria dos Language Servers suporta renomeação entre arquivos, etc.
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

          -- Executa uma ação de código, geralmente seu cursor precisa estar em cima de um erro
          -- ou uma sugestão do seu LSP para que isso seja ativado.
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

          -- Abre um popup que exibe a documentação sobre a palavra sob o seu cursor
          -- Veja `:help K` para entender por que este mapeamento de tecla.
          map("K", vim.lsp.buf.hover, "Documentação de Hover")

          -- AVISO: Isso não é Ir para Definição, isso é Ir para Declaração.
          -- Por exemplo, em C isso o levaria para o cabeçalho.
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- Os dois autocomandos a seguir são usados para destacar referências da
          -- palavra sob o seu cursor quando o cursor permanece lá por um tempo.
          -- Veja `:help CursorHold` para informações sobre quando isso é executado
          --
          -- Quando você move o cursor, os destaques serão limpos (o segundo autocomando).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup =
              vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- O seguinte autocomando é usado para habilitar hints embutidos em seu
          -- código, se o servidor de linguagem que você está usando os suportar
          --
          -- Isso pode ser indesejado, pois eles deslocam parte do seu código
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "[T]oggle Inlay [H]ints") -- [A]tivar/desativar Hints [Embutidos]
          end
        end,
      })

      -- Servidores e clientes LSP são capazes de se comunicar sobre quais recursos eles suportam.
      -- Por padrão, o Neovim não suporta tudo o que está na especificação LSP.
      -- Quando você adiciona nvim-cmp, luasnip, etc., o Neovim agora tem *mais* capacidades.
      -- Então, criamos novas capacidades com nvim cmp e as transmitimos para os servidores.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Habilita os seguintes servidores de linguagem
      -- Sinta-se à vontade para adicionar/remover quaisquer LSPs que você queira aqui. Eles serão instalados automaticamente.
      --
      -- Adicione qualquer configuração de sobrescrita adicional nas tabelas a seguir. As chaves disponíveis são:
      --  - cmd (tabela): Sobrescreve o comando padrão usado para iniciar o servidor
      --  - filetypes (tabela): Sobrescreve a lista padrão de tipos de arquivo associados ao servidor
      --  - capabilities (tabela): Sobrescreve campos em capacidades. Pode ser usado para desabilitar certos recursos LSP.
      --  - settings (tabela): Sobrescreve as configurações padrão passadas ao inicializar o servidor.
      --        Por exemplo, para ver as opções para `lua_ls`, você pode ir para: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        gopls = {},
        pyright = {},
        terraformls = {},
        -- rust_analyzer = {},
        -- ... etc. Veja `:help lspconfig-all` para uma lista de todos os LSPs pré-configurados
        --
        -- Algumas linguagens (como typescript) têm plugins de linguagem inteiros que podem ser úteis:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- Mas para muitas configurações, o LSP (`tsserver`) funcionará perfeitamente
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- Você pode alternar abaixo para ignorar os avisos ruidosos de `missing-fields` do Lua_LS
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Garante que os servidores e ferramentas acima estejam instalados
      -- Para verificar o status atual das ferramentas instaladas e/ou instalar manualmente
      -- outras ferramentas, você pode executar
      --    :Mason
      --
      -- Você pode pressionar `g?` para ajuda neste menu.
      require("mason").setup()

      -- Você pode adicionar outras ferramentas aqui que deseja que o Mason instale
      -- para você, para que estejam disponíveis dentro do Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Usado para formatar código Lua
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- Isso lida com a sobrescrita apenas de valores explicitamente passados
            -- pela configuração do servidor acima. Útil ao desabilitar
            -- certos recursos de um LSP (por exemplo, desativar a formatação para tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
           -- require("lspconfig")[server_name].setup(server) -- TODO está dando erro ao carregar
          end,
        },
      })
    end,
  },

  { -- Autoformatação
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer", -- [F]ormatar buffer
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Desabilita "format_on_save lsp_fallback" para linguagens que não
        -- têm um estilo de codificação bem padronizado. Você pode adicionar linguagens
        -- adicionais aqui ou reativá-lo para as desabilitadas.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        -- O Conform também pode executar vários formatadores sequencialmente
        -- python = { "isort", "black" },
        --
        -- Você pode usar uma sublista para instruir o conform a executar *até* que um formatador
        -- seja encontrado.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletar
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Motor de Snippets e sua fonte nvim-cmp associada
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- A etapa de construção é necessária para o suporte a regex em snippets.
          -- Esta etapa não é suportada em muitos ambientes Windows.
          -- Remova a condição abaixo para reativar no Windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- `friendly-snippets` contém uma variedade de snippets pré-fabricados.
          -- Veja o README sobre snippets de linguagem/framework/plugin individuais:
          -- https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      "saadparwaiz1/cmp_luasnip",

      -- Adiciona outras capacidades de conclusão.
      -- nvim-cmp não vem com todas as fontes por padrão. Elas são divididas
      -- em vários repositórios para fins de manutenção.
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      -- Veja `:help cmp`
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        -- Para entender por que esses mapeamentos foram
        -- escolhidos, você precisará ler `:help ins-completion`
        --
        -- Não, mas sério. Por favor, leia `:help ins-completion`, é realmente bom!
        mapping = cmp.mapping.preset.insert({
          -- Seleciona o [n] próximo item
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Seleciona o item [p] anterior
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          -- Rola a janela de documentação para [b]ack / [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- Aceita ([y]es) o preenchimento.
          -- Isso fará a auto-importação se o seu LSP suportar.
          -- Isso expandirá snippets se o LSP enviou um snippet.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- Se você preferir mapeamentos de teclas de preenchimento mais tradicionais,
          -- você pode descomentar as seguintes linhas
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Aciona manualmente um preenchimento do nvim-cmp.
          -- Geralmente você não precisa disso, porque o nvim-cmp exibirá
          -- preenchimentos sempre que tiver opções de preenchimento disponíveis.
          ["<C-Space>"] = cmp.mapping.complete({}),

          -- Pense em <c-l> como mover para a direita da sua expansão de snippet.
          -- Então, se você tem um snippet que é tipo:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> o moverá para a direita de cada um dos locais de expansão.
          -- <c-h> é semelhante, exceto que o move para trás.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          -- Para mapeamentos de teclas Luasnip mais avançados (por exemplo, seleção de nós de escolha, expansão) veja:
          -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end,
  },

  { -- Você pode facilmente mudar para um esquema de cores diferente.
    -- Mude o nome do plugin do esquema de cores abaixo, e então
    -- mude o comando na configuração para o nome desse esquema de cores.
    --
    -- Se você quiser ver quais esquemas de cores já estão instalados, você pode usar `:Telescope colorscheme`.
    "folke/tokyonight.nvim",
    priority = 1000, -- Certifique-se de carregar isso antes de todos os outros plugins de inicialização.
    init = function()
      -- Carrega o esquema de cores aqui.
      -- Como muitos outros temas, este tem estilos diferentes, e você poderia carregar
      -- qualquer outro, como 'tokyonight-storm', 'tokyonight-moon' ou 'tokyonight-day'.
      vim.cmd.colorscheme("tokyonight-night")

      -- Você pode configurar destaques fazendo algo como:
      vim.cmd.hi("Comment gui=none")
    end,
  },

  -- Destaca tarefas, notas, etc. nos comentários
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  { -- Coleção de vários pequenos plugins/módulos independentes
    "echasnovski/mini.nvim",
    config = function()
      -- Melhores textobjects Around/Inside
      --
      -- Exemplos:
      --  - va)  - [V]isualmente [S]eleciona [A]o [R]edor de [)]parênteses
      --  - yinq - [Y]ank [I]nside [N]ext [']aspas
      --  - ci'  - [C]ambiar [I]nside [']aspas
      require("mini.ai").setup({ n_lines = 500 })

      -- Adicionar/deletar/substituir arredores (colchetes, aspas, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      -- Linha de status simples e fácil.
      -- Você pode remover esta chamada de configuração se não gostar,
      -- e tentar algum outro plugin de linha de status
      local statusline = require("mini.statusline")
      -- defina use_icons como true se você tiver uma Nerd Font
      statusline.setup({ use_icons = vim.g.have_nerd_font })

      -- Você pode configurar seções na linha de status substituindo seus
      -- comportamento padrão. Por exemplo, aqui definimos a seção para
      -- localização do cursor para LINHA:COLUNA
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end

      -- ... e há mais!
      -- Veja: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Destacar, editar e navegar pelo código
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
      -- Instala automaticamente linguagens que não estão instaladas
      auto_install = true,
      highlight = {
        enable = true,
        -- Algumas linguagens dependem do sistema de destaque de regex do vim (como Ruby) para regras de indentação.
        -- Se você estiver enfrentando problemas estranhos de indentação, adicione a linguagem à
        -- lista de additional_vim_regex_highlighting e linguagens desabilitadas para indentação.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
  },

        config = function(_, opts)
                -- [[ Configurar Treesitter ]] Veja `:help nvim-treesitter`

                -- Prefere git em vez de curl para melhorar a conectividade em alguns ambientes
                require("nvim-treesitter.install").prefer_git = true
                ---@diagnostic disable-next-line: missing-fields
                require("nvim-treesitter.configs").setup(opts)

                -- Existem módulos adicionais do nvim-treesitter que você pode usar para interagir
                -- com nvim-treesitter. Você deve explorar alguns e ver o que lhe interessa:
                --
                --    - Seleção incremental: Incluída, veja `:help nvim-treesitter-incremental-selection-mod`
                --    - Mostra seu contexto atual: https://github.com/nvim-treesitter/nvim-treesitter-context
                --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
},

-- Os dois comentários a seguir só funcionam se você baixou o repositório kickstart, e não apenas copiou e colou
-- o init.lua. Se você quiser esses arquivos, eles estão no repositório, então você pode apenas baixá-los e
-- colocá-los nos locais corretos.

-- NOTA: Próximo passo na sua jornada com Neovim: Adicionar/Configurar plugins adicionais para o Kickstart
--
-- Aqui estão alguns exemplos de plugins que incluí no repositório Kickstart.
-- Descomente qualquer uma das linhas abaixo para habilitá-los (você precisará reiniciar o nvim).
--
require("kickstart.plugins.debug"),
require("kickstart.plugins.indent_line"),
require("kickstart.plugins.lint"),
require("kickstart.plugins.autopairs"),
require("kickstart.plugins.neo-tree"),
require("kickstart.plugins.gitsigns"), -- adiciona os keymaps recomendados do gitsigns

-- NOTA: A importação abaixo pode adicionar automaticamente seus próprios plugins, configuração, etc. de `lua/custom/plugins/*.lua`
-- Esta é a maneira mais fácil de modularizar sua configuração.
--
-- Descomente a linha a seguir e adicione seus plugins a `lua/custom/plugins/*.lua` para começar.
-- Para informações adicionais, veja `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
-- { import = 'custom.plugins' },
}, {
ui = {
        -- Se você estiver usando uma Nerd Font: defina os ícones como uma tabela vazia que usará os
        -- ícones padrão da Nerd Font definidos por lazy.nvim, caso contrário, defina uma tabela de ícones unicode
        icons = vim.g.have_nerd_font and {} or {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
        },
},
})

-- A linha abaixo é chamada de `modeline`. Veja `:help modeline`
-- vim: ts=2 sts=2 sw=2 et


---
