-- ~/.config/nvim/lua/plugins/comment.lua
-- Configuração para o plugin Comment.nvim
-- Este plugin permite comentar e descomentar linhas e blocos de código facilmente.

return {
  -- O plugin principal para funcionalidades de comentário
  "numToStr/Comment.nvim",
  -- 'opts' é uma tabela para configurações personalizadas do Comment.nvim.
  opts = {
    -- Desabilita os mapeamentos padrão 'gc' e 'gb' do Comment.nvim
    -- para que possamos definir os nossos próprios.
    mappings = {
      basic = false,    -- Desabilita mapeamentos básicos como 'gcc', 'gco', 'gcO', 'gcA'
      extra = false,    -- Desabilita mapeamentos extras
      extended = false, -- Desabilita mapeamentos estendidos
      g = false,        -- Desabilita os mapeamentos padrão que começam com 'g' (como 'gc' e 'gb')
    },
  },
  -- 'lazy = false' garante que este plugin seja carregado na inicialização do Neovim,
  -- assegurando que a funcionalidade de comentário esteja sempre disponível.
  lazy = false,
  -- Define os mapeamentos de teclas personalizados para comentar.
  -- Estes mapeamentos serão ativos nos modos Normal ('n') e Visual ('v').
  keys = {
    -- Mapeamento para comentar/descomentar em linha (linewise)
    -- <M-c> representa a combinação de teclas Alt + c.
    { "<M-c>", mode = { "n", "v" }, desc = "Toggle Comment (Linewise)", function() require("Comment.api").toggle.linewise.current() end },
    -- Mapeamento para comentar/descomentar em bloco (blockwise)
    -- <M-v> representa a combinação de teclas Alt + v.
    { "<M-v>", mode = { "n", "v" }, desc = "Toggle Comment (Blockwise)", function() require("Comment.api").toggle.blockwise() end },
  },
}
