-- @file: ~/.config/nvim/lua/plugins/Gemini.lua
-- @mission: Configura o plugin gemini.nvim, garantindo que ele seja carregado e configurado pelo LazyVim.

local api_key = os.getenv("GEMINI_API_KEY")

if not api_key then
    vim.notify("GEMINI_API_KEY não encontrada! Configure a variavel de ambiente.", vim.log.levels.WARN,
        { title = "Gemini.nvim" })
    return {}
end

return {
    "reyzzao/gemini.nvim",
    event = "VeryLazy",
    config = function()
        require("gemini").setup({
            API_KEY = api_key,
            model = "gemini-1.5-flash-latest" -- #editable Altere o nome do modelo aqui
        })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
