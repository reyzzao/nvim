-- ~/.config/nvim/lua/custom/plugins/catppuccin.lua
-- Este arquivo DEVE retornar uma tabela de plugin para o lazy.nvim
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Um colorscheme geralmente deve carregar cedo
    config = function()
        -- Aqui você coloca a função de setup do Catppuccin
        -- que configura as variantes (mocha, macchiato, etc.)
        require('catppuccin').setup({
            flavour = 'mocha', -- Ou 'macchiato', 'frappe', 'latte'
            background = {
                light = "latte",
                dark = "mocha",
            },
            -- Adicione as integrações para outros plugins que você usa,
            -- para que o Catppuccin aplique suas cores a eles.
            integrations = {
                cmp = true,          -- Para nvim-cmp
                gitsigns = true,     -- Para gitsigns.nvim
                nvimtree = true,     -- Para nvim-tree.lua
                telescope = true,    -- Para telescope.nvim
                treesitter = true,   -- Para nvim-treesitter
                bufferline = true,   -- Para bufferline.nvim (se você usar)
                dap = {             -- Para nvim-dap
                    enabled = true,
                    enable_integrations = true,
                    custom_highlights = false,
                },
                -- Adicione mais integrações conforme os plugins que você instala
            },
            transparent_background = true, -- <--- MUDANÇA CRÍTICA AQUI: AGORA É TRUE!
            term_colors = true,             -- Usa as cores do tema no terminal integrado do Neovim
            -- ... outras opções de configuração do catppuccin que você queira
        })
    end,
}
