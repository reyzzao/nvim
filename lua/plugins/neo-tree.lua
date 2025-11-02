-- @file: ~/endereco_relativo/neo-tree.lua
-- @mission: Explorer de arquivos com atalhos e mapeamento de 'm' para mover o item marcado para o diretorio pai.

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    -- Seu atalho Alt-e para Home
    {
      "<A-e>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "left", -- Ajustado para 'left'
          source = "filesystem",
          dir = vim.fn.expand("~")
        })
      end,
      desc = "NeoTree: Navegar fora do projeto",
    },
    -- Seu atalho E para o projeto
    {
      "E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "left", -- Ajustado para 'left'
          source = "filesystem",
          dir = vim.fn.expand('%:p:h')
        })
      end,
      desc = "NeoTree: Navegar no projeto",
    },
  },
  opts = {
    window = {
      position = "left", -- Ajuste principal: [ right = direita, left = esquerda ]
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_git_ignored = false,
        hide_hidden = false,
      },
      follow_current_file = {
        enabled = true,
        open_tree = true,
      },
      group_empty_dirs = false,
    },
    renderer = {
      icons = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
      tree_lines = {
        with_indents = true,
        ordering = "top_down",
        fold_level = false,
      },
    },
    
    -- *** ATALHOS DE MANIPULACAO (FINAL E SIMPLIFICADO) ***
    commands = {
      -- Comandos que funcionam sem prompt:
      ["a"] = "create",          -- A: Criar (Arquivo ou Diretorio)
      ["r"] = "rename",          -- R: Renomear
      ["y"] = "copy",            -- Y: Copiar (Marca para Copiar/Yank)
      
      ["x"] = "cut",             -- X: RECORTAR (NOVO - Marca para Recortar/Cut - Pode usar para mover recortando.)
      
      ["d"] = "delete",          -- D: Deletar (Lixeira/Trash)
      ["m"] = "move_to_parent",  -- M: Mover para o DIRETÓRIO PAI (UP)
      ["p"] = "paste",           -- P: Colar (Cola o item copiado 'y' ou recortado 'x')
      
      -- Atalhos Uteis
      ["<leader>e"] = "open_with_system", -- Abrir com o aplicativo padrao do SO
      ["<C-l>"] = "refresh",             -- Recarregar a arvore
      ["g."] = "toggle_hidden",          -- Mostrar/Esconder arquivos ocultos
      ["H"] = "toggle_hidden",           -- Atalho alternativo para mostrar/esconder
    },
  },
  config = function()
    require("neo-tree").setup({})

    vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
      group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
      callback = function()
        -- Verificacao para nao abrir em buffers como terminal ou quickfix
        local buftype = vim.api.nvim_get_option_value("buftype", { scope = "local" })
        if buftype == "" or buftype == "acwrite" then
          require("neo-tree.command").execute({
            action = "toggle_focus",
            position = "left", -- Ajustado para 'left' aqui tambem
            source = "filesystem",
            dir = vim.fn.expand("%:p:h")
          })
        end
      end,
    })
  end,
}