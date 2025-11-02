
---
### Atalhos Tmux


---

### Configuracoes
- Prefixo:  `F1`
---
Essenciais, organizados em um fluxo de trabalho lógico.

-----

### Início e Gerenciamento de Sessões

Estes comandos te ajudam a entrar e sair do Tmux, e a gerenciar suas sessões principais.

```sh
# Inicia uma nova sessão do Tmux
tmux

# Inicia uma nova sessão com um nome específico - nomear uma sessao.
tmux new-session -s <nome_da_sessao>

# Desconecta da sessão atual, deixando-a rodando em segundo plano
# Prefixo + d
# Onde Prefixo = Ctrl + a

# Lista todas as sessões rodando
tmux ls

# Reconecta à última sessão que você desconectou
tmux attach

# Reconecta a uma sessão específica
tmux attach -t <nome_da_sessao>

# Encerra uma sessão específica
tmux kill-session -t <nome_da_sessao>
```

-----

### Janelas (Abas)

Use estes comandos para criar, navegar e organizar suas janelas dentro de uma sessão.

```sh
# Prefixo + c: Cria uma nova janela
# Prefixo + n: Vai para a próxima janela
# Prefixo + p: Vai para a janela anterior
# Prefixo + w: Mostra uma lista de todas as janelas para navegação
# Prefixo + ,: Renomeia a janela atual
# Prefixo + &: Mata a janela atual
```

-----

### Painéis (Divisões da Tela)

Use estes comandos para dividir sua tela e trabalhar em múltiplos terminais ao mesmo tempo.

```sh
# Prefixo + ": Divide a tela horizontalmente
# Prefixo + %: Divide a tela verticalmente
# Prefixo + <seta>: Navega entre os painéis (setas: ↑, ↓, →, ←)
# Prefixo + z: Maximiza o painel atual (pressione novamente para restaurar)
```

-----

### Comandos de Configuração e Utilitários

Estes comandos são úteis para configurar o Tmux e gerenciar arquivos.

```sh
# Prefixo + $: Renomeia a sessão atual
# Prefixo + r: Recarrega o arquivo ~/.tmux.conf
# Para renomear a janela atual via linha de comando:
# Prefixo + :, digite "rename-window <novo_nome>", Enter
```

---

---
Editores_IDEA
- Ranking:
  - 1 Neovim - Rapido e Poderoso
  - 2 : VsCodium - Bom para Markdown , Workspace , ( ise na Home Rai,z Works Dedicado.)
  - Temas_Tops: [ 1- Tokyo Nigth by enkia, ]
  
---
Use_IA_no_Editor
- Tutoriais : [byTartarugaDev](https://youtu.be/W6wXZXfE9jw?si=lg8BMMcIR1lvWYr3)
- Implementacao: no Nvim, [by gmn](https://g.co/gemini/share/aaa052a939ed)
- Use_nos_Modos:
	- Tutor: Quando Dev aprendendo alho novo.
	- Assistente: Features são simples
	- Agente: Quando são pedidos urgentes
---

Tops_atalhos_Universais
- Usar_AutoSave: true
- Recuperar_Ultimos_Buffers_Fechados: ctr+shift+t

---

Nvim_VsCodium
- Conceitos Nvim VsCodium [by gemini]()
---
### IMPORTANTE NO EDITOR 

Textos
* Passar mouse e ver definições do artefato
* Renomear artefato em todo projeto

Pesquisa
* encontrar todas ocorrências em todo projeto 

Edicao
* Multi-cursor em todas as linhas correspondentes no Neovim, semelhante ao multi-cursor do VSCode, 
 expande em todas linhas iguais conforme indicaremos com a seta, para escrevermos ou usarmos comandos iguais, semelhante ao vscode.
 
 ---

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

---






---
