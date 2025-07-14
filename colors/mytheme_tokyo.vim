" colors/mytheme_tokyo.vim

highlight clear
if exists("syntax_on")
  syntax reset
endif
set background=dark
lua require('colorschemes.mytheme_tokyo') " <<--- Este nome deve ser o do seu arquivo Lua!