Atalhos
 
 Analises
 - Sequencias_Teclas_Compativeis_NvimVsCodium: 
  - Contrl_Alt: exemplo: ctrl+alt+ <QUALQUER OUTRA> 

Memorizar
Nvim
- Alusao_Atalho com: `j` sempre leva para "baixo" ou para "frente", e a `k` para "cima" ou para "trás"
 
Atalhos iguais em todos os modos ( normal, insert, visual ) 

Obs: sem comentários, o que seriam. comentarios: põem em uma key chamada `desc` de descrição. 

Nvim
Explorer : nvim-tree.

Pressione `m` para "mover" o item selecionado.navegue até a pasta de destino onde você quer colocar o arquivo/pasta.
Pressione `p` (para "paste", colar) ou m novamente para colar o item na pasta de destino.

O nvim-tree também tem outros atalhos úteis para o gerenciamento de arquivos:
a: Adicionar um novo arquivo ou pasta.
r: Renomear o arquivo ou pasta.
d: Deletar o arquivo ou pasta.
y: Copiar o caminho do arquivo.

Nvim_Dicas :
- checar se atalho esta em uso `:nmap <e o atalho alvo>, exemplo : :nmap <leader>ic` 

Terminal
- aceitar_sugestoes: <Tab> deixe o tab livre sempre para aceitar sugestoes de auto complete geral.
- abrir_novo_terminal : <C-t >
- toggle_terminal : <A-t >

By_Editor
- restart_reload_editor: ctrl+shift+r

by_Artefatos
renomear_simbolo: nvim: <leader>rn (escolhe renomear simbol), vscode: f2

Acoes
- salvar : C-s
- salvar_mudancas_replace_no_arquivo : C-c
- salvar_mudancas_replace_all_todos_arquivos : C-C

By_Arquivos
- Criar_Arquivo: nvim: ou :`!mkdir -p <caminho_para_a_pasta> && touch <caminho_para_o_arquivo>`
- Executar_Inserir_endereco_loca_arquivo_no_topo 
  - nvim: use o command_line: :`InsertHeader`
  - vscode: task/snippets em arquivos em arquivos de projetos deno .ts : ctr+shift+t

 - toogle_identacao: Identar: "alt+.", desidentar: "alt+,"
 
- fechar_Editor_Confirmando: nvim: <leader>k , vscode: ctrl+shift+k 
- fechar_todos_buffers_confirmando: A-q
- copiar_com_clipboarSistema : C-s-c )
 - colar_com_clipboardSistema: C-S-v | p
 - recortar: 
 - duplicar: C-Down
 - voltar_atraz: (Esc-u no vscodium)
 - refazer: C-S-r ???
 - desfazer: C-z
 - deletar linha: A-d
 - deletar linhas selecionadas: A-d
 - explorer1: A-e [no nvim: nvim-tree]
 - explorer2: leader-e [só no nvim: netwr padrao.]
 - multi_cursor com setas: C-S-setas
 - selecionar_tudo: C-a
 - selecionar_linha: C-l
 - pesquisar_e_substituir_no_arquivo: C-f
 - pesquisar_e_substituir_no_projeto_todo: "no nvim estou usando funcao #mybash chamada: replace ()"
 - busca_arquivos: C-p | (No nvim e vimrc abre telescope , com : "/" ou C-p ) +(vscodium : C-p padrao.)
 - Opcoes_de_Temas: C-k-C-t
 - renomar_variavel: F2 (reflete todo projeto)
 - toogle_redmensionar_janelas: Shift- setas (todos lados)
 - mover_linhas: Alt+setas pra cima ou pra baixo.
 - ir_para_primeira_do_arquivo: C-Home
 - ir_para_ultima_do_arquivo: C-End
 - fechar_buffer_em_foco_com_confirm: A-w
 - fechar_todos_buffer_com_confirm: A-q
 - buffer_bnext: Ctrl+Tab
 - buffer_bpreview: C-S-Tab
 - Copiar_Caminho_do_Arquivo: <C-A-p> [ok nos 2 editores] neural: p de path
 - comentario_em_linha: S-c
 - comentario_em_nlovo: S-v
 - navegacao_entre_janelas_tabs_buffers: C-j (voltar) , C-k (pra frente) 
 - Expandir_AutoComplets_Snippets: e navegar pelos placeholders Ctr+Tab 

---
Options
- AutoSave: true
- auto carregar arquivos no caso de mudanças
- 