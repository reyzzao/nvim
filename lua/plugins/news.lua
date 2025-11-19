-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp", "java", "bash", "javascript" },
  sync_install = false,

  highlight = {
    enable = true,
    disable = { "c", "bash", "markdown" },
    additional_vim_regex_highlighting = false,
  },
}

--NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- VimMove
-- Alt + k → Move to Up
-- Alt + j → Move to Down
-- Alt + l → Move to Right(Visual Mode to 2 or more chars, Ex.: //)
-- Alt + h → Move to Left(Visual Mode to 2 or more chars. Ex.: //)

--if filenamel == nil then
if filenamel == "" then
  --print("Empty variable!")
  require("notify")("Bem-vindo(a) ao TerrooNvim!")
end
