-- ~/.config/nvim/lua/custom/keymaps/index.lua

-- Este arquivo é o loader principal para todos os seus mapeamentos de teclas.
-- Ele percorre todos os arquivos .lua nesta pasta (exceto ele mesmo)
-- e os carrega para aplicar os mapeamentos.

local function load_keymap_files()
    local keymaps_dir = vim.fn.stdpath("config") .. "/lua/custom/keymaps"
    local files = vim.fn.glob(keymaps_dir .. "/*.lua", true, true)

    for _, file_path in ipairs(files) do
        local file_name = vim.fn.fnamemodify(file_path, ":t:r")
        
        -- Evita carregar o próprio 'index.lua' recursivamente
        if file_name ~= "index" then
            -- Converte o caminho do arquivo para um nome de módulo Lua
            -- Ex: /home/user/.config/nvim/lua/custom/keymaps/general.lua -> custom.keymaps.general
            local module_name = file_path:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub(".lua", ""):gsub("/", ".")
            
            pcall(require, module_name) -- 'pcall' para evitar que um erro em um arquivo quebre o Neovim
        end
    end
end

load_keymap_files()
