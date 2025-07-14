" colors/mytheme_nvim.vim

" Limpa quaisquer destaques existentes (redundante, mas seguro)
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Set options
set background=dark " ou light, dependendo do seu tema

" Carrega o tema Lua
lua require('colorschemes.mytheme_nvim')