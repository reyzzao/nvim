    -- ~/.config/nvim/lua/custom/plugins/notify.lua

    return {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup({
          background_colour = '#000000', -- Fundo preto para o pop-up
          stages = 'fade_in_slide_out',  -- Animação
          timeout = 3000,                -- Tempo que a notificação fica visível (3 segundos)
          max_height = function() return math.floor(vim.opt.rows:get() * 0.75) end,
          max_width = function() return math.floor(vim.opt.columns:get() * 0.75) end,
          -- Adicione outras opções de configuração aqui, se desejar
        })
      end,
    }
    