
---

Explorer: 
- linhaDoTempo: 2000 > nerd-tree, 2023 >nvim-tree, 2024 > neo-tree
- Plugs: 
	- neo-tree (diferencial explorer flutuante) - doc: [git ](https://github.com/nvim-neo-tree/neo-tree.nvim)
Realcar_Ocorrencias_de_Palavra_Selecionada: plug: vim-illuminate,
- Multiplos_Cursor_na_linha_de_baixo : plug: smoka7/multicursors.nvim
- Mostrar_Linhas_das_Chaves , plug: indent-blankline.nvim
- realçar ocorrências ao clicar em uma palavra , plug: vim-illuminate, status: lazyvim ja tem por default
- auto_save: nao estou usando plug, mas ta auto salvando no autocmd.lua, caso for usar plug tem nesta issue: (https://github.com/LazyVim/LazyVim/issues/2491)

Roteador_Projetos:
- Plugin : vim-rooter : repo: "airblade/vim-rooter"
    - Para: automaticamente mudar o diretório de trabalho do Neovim para a raiz do seu projeto. 
    - Faz: com que o explorer em uso (neo-tree se encontre dentro do projeto, procurando arquivos de configuracao de projeto como: [ deno.json, package json, .git, etc tudo que configure-se como um projeto.]
- Command_Line_Flutuante: plug: dressing.nvim, status: o lazyvim já usa por default
- Popular_Menu_de_Ajuda_via_Leader:plug:  which-key, status: o lazyvim já usa por default
- Fechamento_de_chaves: plug: **/nvim-autopairs.lua**, status: o lazyvim já usa por default

---


---