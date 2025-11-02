
---
### Atalhos

Comandos_Edicao_Vim
`0` começo da linha
`$` fim da linha
`w` pula palavra pra frente (word)
`b` pula palavra pra traz (back)



Atalhos_em_uso

Pesquisa
- telecope: Space + Space
- explorer_local_projeto: <A-e>
- explorer_home:  <leader>e
- 

Artefatos

- replace_textos_globais_entre_diretorios_do_projeto:
  - com telescope: <leader>fg / digita o termo /<C-q> = (vai listar ocorrencias) / command_line digite :cdo s/termo/mudanca/g | update
- ir_para_definicao_de_variavel : `K` maiusculo de Keyword // ou clique com a esquerda / go definition
- mover_linhas : shift + setas pra cima e pra baixo


Visual
- ver informacoes doa artefato: `K` maiuculo, ou <leader>li >> mapeado para o vim.lsp.buf.hover()
- copiar_caminho_absoluto_do_arquivo_em_uso: <leader>pc, neural: path copy - caminho copiado

Navegacoes
- Navegar_entre_paginas_buffers_tabs: <C-Right> && <C-Left> // ctr+ setas lados direito e esquerdo.

Editor
- Recarregar_Configuracoes: <leader>prc
- resize_janelas: <C-S-h>  &  <C-S-l> & <C-S-k>  &  <C-S-j>

Conceitos
- opcoes_posicao: left , right

Teclas_mapeaveis
- espaco: <Space> //  <Space> é usado para representar a tecla espaço, enquanto Space é um caractere de espaço literal.
  - Exemplo: nnoremap <C-Space> :NvimTreeToggle<CR>: Mapeia a combinação de teclas Ctrl+Space para o comando NvimTreeToggle.
- alt: A ou M



---

Explorer
{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Alternar Explorer (NvimTree)" },
    { "a", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar arquivo" },
    { "d", "<cmd>NvimTreeCreate<cr>", mode = { "n", "v" }, desc = "Criar pasta" },
    { "r", "<cmd>NvimTreeRename<cr>", mode = { "n", "v" }, desc = "Renomear" },
    { "x", "<cmd>NvimTreeDelete<cr>", mode = { "n", "v" }, desc = "Deletar" },

---
Sugestões de Mapeamento Neovim para a Filosofia Neural
A seguir, uma lista de mapeamentos sugeridos, onde o objetivo é substituir os atalhos de Ctrl e Alt por sequências mais lógicas e fáceis de memorizar usando a tecla <leader> (geralmente <space>).
Mapeamentos de Navegação e Edição
| Ação | Mapeamento Atual | Mapeamento Proposto | Nomeação Neural |
|---|---|---|---|
| Salvar Arquivo | <C-s> | <leader>w | w de write (escrever) |
| Sair do Vim | <C-q> | <leader>q | q de quit (sair) |
| Salvar e Sair | <C-w> | <leader>Q | Q de Quit and Save (sair e salvar) |
| Voltar (Desfazer) | <C-u> | <leader>b | b de back (voltar) |
| Refazer | <C-r> | <leader>f | f de forward (avançar) |
| Deletar Linha | <C-d> | <leader>dd | d de delete (deletar) |
| Copiar Linha | <C-y> | <leader>yy | y de yank (copiar) |
Mapeamentos de Janelas e Abas
| Ação | Mapeamento Atual | Mapeamento Proposto | Nomeação Neural |
|---|---|---|---|
| Nova Janela (Horizontal) | <C-w>s | <leader>ws | w de window (janela), s de split (dividir) |
| Nova Janela (Vertical) | <C-w>v | <leader>wv | w de window (janela), v de vertical |
| Fechar Janela | <C-w>q | <leader>wc | w de window (janela), c de close (fechar) |
| Nova Aba | :tabnew | <leader>tn | t de tab (aba), n de new (novo) |
| Próxima Aba | gt | <leader>gt | goto tab (ir para aba) |
| Aba Anterior | gT | <leader>gT | goto Tab (ir para aba, maiúsculo) |
Mapeamentos de Busca e Substituição
| Ação | Mapeamento Atual | Mapeamento Proposto | Nomeação Neural |
|---|---|---|---|
| Substituir no Arquivo | :s | <leader>r | r de replace (substituir) |
| Pesquisar com Grep | :grep | <leader>g | g de grep (pesquisar) |
| Ir para o próximo resultado de busca | n | <leader>n | n de next (próximo) |
| Ir para o resultado de busca anterior | N | <leader>N | N de Next (próximo, maiúsculo) |
Mapeamentos para o seu Espaço de Trabalho
A sua ideia de criar um prefixo ou namespace é ótima para evitar conflitos. Sugerimos o prefixo <leader>p para "projeto" ou "pessoal".
| Ação | Mapeamento Atual | Mapeamento Proposto | Nomeação Neural |
|---|---|---|---|
| Abrir explorador de arquivos | N/A | <leader>pe | pessoal explorer |
| Buscar em todos os arquivos | N/A | <leader>pg | pessoal grep |
| Buscar arquivos no projeto | N/A | <leader>pf | pessoal find |

- Instalar: Lsp:  comandline: `:Mason` para verificar se no caso apra golang o `gopls` está na sua lista de pacotes instalados. Se não estiver, instale-o >> vai aparecea listagem de disponiveis, selecione com C-f a linguagem par filtrar, escolha o alvo com ENTER que vai instalar.

- ver se lsp esta ativo no arquivo : command: `:LspInfo`
- ir para go definition da funcao : `gd  # definicao local` , `gd # definicao global` , `gt  # definicao de tipo`
- Mostra a documentação da função (hover) em uma janela flutuante: atalho `K`
- limpar_cache_de_plugin_especifico: `rm -rf ~/.local/share/nvim/lazy/<NOME_DO_PLUGIN>.nvim` # exemplo : rm -rf ~/.local/share/nvim/lazy/neo-tree.nvim
- 

---
Conceitos
- Tudo que for mais amplo usa i shift pra deixar maiusculo os stalhos de comandos.
- De passando em passando,  são letras minúsculas nos atalhos.

---

Command_Line:

Pesquisa_e_Substituicao
- Subtitui_1_Ocorrencia: `s/pesquisa/substuicao`
- Subtitui_todas_Ocorrencias_no_ArquivoEmFoco: `%s/pesquisa/substuicao/g`

Executar_Comandos_Bash: :`!<comando_bash>` # mostra o comando nao interativo e sai

---
Inserts
- Comeco_Linha: `I`
- Fim_Linha: `A`
- navegar_palavras: `b` pra frente, `w` pra traz.
- pular_palavras_e_especiais: `B`  frente, `W` atrás


---

Tutoriais
- Vim - by ThiagoMota, [Link :]( https://youtu.be/R62NTq4ae9o?si=2C8o7km1OAvc2U-2)

---


---

### Comandos NVim
- replace: com telescope : `:cdo s/termo_antigo/termo_novo/g | update`
 - explicacao: cdo: Executa um comando em cada item da lista do quickfix. 
    -- s/termo_antigo/termo_novo/g: É o comando de substituição.
    -- g: Garante que todas as ocorrências na linha sejam substituídas.
    -- | update: Salva as alterações feitas no arquivo.

### Comandos Vim

- `:w`: Salva o arquivo.
- `:q`: Sai do Vim.
- `:wq` ou `:x`: Salva e sai.
- `:q!`: Sai sem salvar (descarta as alterações).
- identacao : no modo normal:  shift << ou >>  
- `:e [caminho/do/arquivo]`: Abre um novo arquivo para edição.
    
- `:split [caminho/do/arquivo]`: Abre um novo arquivo em uma divisão horizontal.
    
- `:vsplit [caminho/do/arquivo]`: Abre um novo arquivo em uma divisão vertical.
    
- `:buffers`: Lista os buffers abertos.
    
- `:b [número_do_buffer]`: Alterna para um buffer específico.
    
- `:%s/antigo/novo/g`: Comando de substituição que já vimos.
    
- `:! [comando_shell]`: Executa um comando do shell. Por exemplo: `:!ls -l`
    
- `:r ! [comando_shell]`: Insere a saída de um comando shell no buffer atual. Por exemplo: `:r !date`
    
- `:set [opção]`: Configura opções do Vim. Ex: `:set nu` (mostra números de linha), `:set nonu` (oculta).

- atualizar novos parsers add nos plugs : :`TSUpdate` -- é o mesmo de ir no menu d eplugins e apertar U .
    
- `:help [tópico]`: Abre a documentação de ajuda do Vim para um tópico específico. Ex: `:help :s`, `:help recovery`.
---
- **`Ctrl + ^`** (ou `Ctrl + 6`): Troca para o **último buffer visitado**. Isso é super útil para alternar rapidamente entre dois arquivos.
    
    - **Neural:** Pense como um "toggle" entre o arquivo atual e o que você estava editando por último.
        
- **`:bnext`** (ou `:bn`): Vai para o **próximo buffer** na lista.
    
- **`:bprevious`** (ou `:bp`): Vai para o **buffer anterior** na lista.
    
- **`:buffers`** (ou `:ls`): Lista todos os buffers abertos com seus respectivos números.
    
- **`:b [número]`**: Abre um buffer específico pelo seu número (ex: `:b 3`).
    
- **`:b [nome_do_arquivo]`**: Abre um buffer específico pelo nome (pode ser parcial e usar Tab para autocompletar).
- **recarregar_vim_arquivo : no command: `:source %`

---
### My Functions by Vim

- Procurar_no_Ptojeto :
     - Não precisa abrir outro terminal! Você pode usar as funções que te passei diretamente de dentro do Vim, no modo de comando, exatamente como você imaginou.
           Usando as Funções SH Dentro do Vim
O "footer de comando" que você menciona é o modo de comando do Vim (também conhecido como linha de comando ou command-line mode). É onde você digita comandos que começam com :.
Para executar um comando do shell (como nossas funções search_project e replace_project), você usa o prefixo !.
Então, para usar as funções:
 * Primeiro, certifique-se de que as funções estão carregadas no seu shell. Se você as adicionou ao seu ~/.bashrc (ou ~/.zshrc, ~/.profile), elas estarão disponíveis automaticamente na próxima vez que você abrir um novo terminal. Se você as adicionou e não reiniciou o terminal, execute source ~/.bashrc (ou o nome do seu arquivo) no seu terminal (fora do Vim, uma vez) para carregá-las.
 * Dentro do Vim, no modo normal, pressione :.
 * Digite o comando com ! e o nome da função, seguido pelos argumentos.
   * Para pesquisar:
     :!search_project "termo_de_busca" "extensão"

     Exemplo:
     :!search_project "minhaVariavel" "js"

     A saída do comando aparecerá na parte inferior da tela do Vim, e você poderá pressionar ENTER para retornar ao editor.
   * Para substituir:
     :!replace_project "termo_antigo" "termo_novo" "extensão"

     Exemplo:
     :!replace_project "oldFunc" "newFunc" "py"

     Lembre-se sempre da ATENÇÃO com replace_project: ela modifica arquivos. Certifique-se de ter um backup ou estar usando controle de versão (como Git) antes de executá-la, especialmente dentro do Vim, onde o feedback visual é menor que no terminal.
Dicas Adicionais:
 * Completar comandos: No modo de comando do Vim, você pode usar a tecla Tab para autocompletar nomes de arquivos, comandos e, às vezes, até mesmo comandos do shell.
 * Histórico de comandos: Use as setas Para Cima e Para Baixo para navegar pelo histórico de comandos que você digitou no modo de comando do Vim.
Essa é uma forma muito poderosa de integrar o poder do seu shell com o seu fluxo de trabalho no Vim!

---
ATALHOS

**Explorer**
- Manusear arquivos, - Tutorial : by    [Link :]( https://g.co/gemini/share/e01829b93859)


**Pesquisas**
Telescope
- Telescope_Nvim: Para as funcionalidades de busca (C-f, C-g C-f, C-p) 

---
COMMANDS
- ver_buffers: Telescoe buffers
- nensagens: messages
- ia_gemini: Gemini
- 
---


toogle alternar maiusculo minusculo : leader>U

Com certeza. A filosofia do Vim e Neovim é baseada em "verbos" e "substantivos"
para formar comandos, e a diferenciação entre maiúsculas e minúsculas é
fundamental para isso, onde a minúscula geralmente atua em nível local ou em uma
palavra, e a maiúscula em um nível mais global, como uma linha inteira.

Aqui está uma lista de comandos essenciais, seguindo a sua estrutura e as
convenções que você mencionou: Modos de Operação

- i: Entra no modo de inserção, permitindo digitar a partir da posição atual do
  cursor.
- a: Entra no modo de inserção, permitindo digitar após a posição atual do
  cursor.
- I: Entra no modo de inserção no início da linha.
- A: Entra no modo de inserção no fim da linha.
- o: Entra no modo de inserção, criando uma nova linha abaixo da atual.
- O: Entra no modo de inserção, criando uma nova linha acima da atual. Comandos
  de Movimentação
- h: Move o cursor para a esquerda.
- j: Move o cursor para baixo.
- k: Move o cursor para cima.
- l: Move o cursor para a direita.
- w: Move para a próxima palavra.
- b: Move para o início da palavra anterior.
- e: Move para o fim da palavra atual.
- 0 (zero): Move para o início da linha.
- $: Move para o fim da linha.
- ^: Move para o primeiro caractere não em branco da linha.
- gg: Move para a primeira linha do arquivo.
- G: Move para a última linha do arquivo.
- %: Encontra o par correspondente para parênteses (), chaves {}, ou colchetes
  []. Comandos de Exclusão (Deletar/Remover)
- x: Deleta o caractere sob o cursor.
- d: Deleta. (Esse comando precisa de um "substantivo" para saber o que deletar,
  por exemplo: dw, d$, dd).
- dd: Deleta a linha inteira.
- dw: Deleta a palavra a partir do cursor.
- d$: Deleta do cursor até o final da linha.
- D: Deleta do cursor até o final da linha. (Equivalente a d$).
- C: Deleta do cursor até o final da linha e entra no modo de inserção.
  (Equivalente a c$).
- cc: Deleta a linha inteira e entra no modo de inserção. Comandos de Cópia
  (Yank) e Cola (Paste)
- y: Copia (yank). (Precisa de um "substantivo", por exemplo: yw, y$, yy).
- yy: Copia a linha inteira.
- yw: Copia a palavra a partir do cursor.
- y$: Copia do cursor até o final da linha.
- Y: Copia a linha inteira. (Equivalente a yy).
- p: Cola o conteúdo copiado após o cursor.
- P: Cola o conteúdo copiado antes do cursor. Comandos de Busca e Substituição
- /: Inicia a busca para frente.
- ?: Inicia a busca para trás.
- n: Vai para a próxima ocorrência da busca.
- N: Vai para a ocorrência anterior da busca.
- :: Entra no modo de comando para executar comandos de linha.
- s: Substitui um caractere. (Entra no modo de inserção).
- S: Substitui a linha inteira. (Equivalente a cc).
- : + %s/palavra_antiga/palavra_nova/g: Substitui todas as ocorrências de
  palavra_antiga por palavra_nova no arquivo (% para todo o arquivo, g para
  todas as ocorrências na linha). Comandos de Desfazer e Refazer
- u: Desfaz a última alteração.
- ctrl + r: Refaz a alteração desfeita. Comandos de Salvar e Sair
- :w: Salva o arquivo.
- :q: Sai do Vim/Neovim.
- :wq: Salva e sai.
- :x: Salva e sai. (Semelhante a :wq).
- :q!: Sai sem salvar as alterações. Essa lista cobre os comandos mais comuns
  para começar a se movimentar e editar no Vim/Neovim. Para alcançar a
  produtividade máxima com o lazy.nvim, que você usa, a chave é aprender a
  combinar esses comandos e explorar os plugins que ele oferece.

---

**Explorer**

- Manusear arquivos, - Tutorial : by
  [Link :](https://g.co/gemini/share/e01829b93859)

**Pesquisas** Telescope

- Telescope_Nvim: Para as funcionalidades de busca (C-f, C-g C-f, C-p)

---
Atalhos

Salvar & Formatar : <leader>s
Fechar_Buffer : <leader>bc
Fechar_Tudo : <leader>bq
Próximo_Buffer : <leader>bn
Buffer_Anterior : <leader>bp
Selecionar_Tudo : <leader>sa
Duplicar_Linha : <leader>dl
Alternar_NvimTree : <leader>e
Buscar_Arquivos : <leader>ff
Pesquisar_no_Arquivo : <leader>fs
Pesquisar_no_Projeto : <leader>ps
Copiar_Caminho : <leader>cp
Substituir_geral : <leader>sr
Substituir_c_conf : <leader>src

Navegação_entre_Buffers_próximo : C-j
Navegação_entre_Buffers_anterior : C-k
Inserir_Cabeçalho : :InsertHeader:
Git_próxima_alteração : <leader>gn
Git_alteração_anterior : <leader>gp
Git_stage_alteração_atual : <leader>gs
Git_reverter_alteração_atual : <leader>gr
Git_stage_todo_o_buffer : <leader>gS
Git_reverter_todo_o_buffer : <leader>gR
Git_preview_alteração : <leader>gv
Git_blame_persistente : <leader>gb
Ações_de_Edição_Limpar_texto : <leader>c
---
Command_Line


---
## **Comandos_Command_Line**

### editor
- instalar_plugins: :Lazy sync
- checar_plugins_instalados: :LazyHealth


### ​Informações e Ajuda

- :messages - Mostra Mensagens do Sistema do editor.
	- ​ - Tutorial : messages - notify  by gmn [Link :]( https://g.co/gemini/share/ade7ad5263cc)
	- messages é o histórico e o log de mensagens do Neovim, via console.
	- nvim-notify é o sistema de notificação em tempo rea rapida faz o mesmo do messages e com melhor aparência e vc nao precisa acessar o console pra ve-las.
- ​::help :command - Exibe a documentação completa para um comando específico. Por exemplo, :help :messages.
- ​:version - Mostra a versão do Neovim, informações sobre os arquivos de configuração, e recursos compilados.
- ​:set - Exibe todas as opções de configuração que foram alteradas em relação aos valores padrão.
- ​:set all - Lista todas as opções de configuração e seus valores atuais.

### ​Gerenciamento de Buffer e Arquivo

- ​:e <caminho_do_arquivo> - Edita um novo arquivo. O <caminho_do_arquivo> pode ser um caminho completo ou relativo.
- ​:w - Salva o arquivo atual.
- ​:w! - Salva o arquivo atual à força, mesmo que ele seja somente leitura.
- ​:bd - (Buffer Delete) Fecha o buffer atual sem fechar a janela.
- ​:ls - Lista todos os buffers abertos no momento.
- ​:b<número> - Alterna para o buffer com o número especificado. Por exemplo, :b2.
- ​:bnext - Vai para o próximo buffer na lista.
- ​:bprev - Vai para o buffer anterior na lista.

### ​Janelas e Layout

- ​:sp - (Split) Divide a janela horizontalmente, abrindo um novo buffer.
- ​:vsp - (Vertical Split) Divide a janela verticalmente, abrindo um novo buffer.
- ​:q - (Quit) Fecha a janela atual.
- ​:only - Fecha todas as outras janelas, mantendo apenas a atual.
- ​Ctrl-w + h/j/k/l - Move o cursor entre janelas (h: esquerda, j: baixo, k: cima, l: direita).

### ​Busca e Substituição

- ​:/<termo> - Procura por <termo> no documento.
- ​:s/<termo_antigo>/<termo_novo>/g - (Substitute) Substitui todas as ocorrências de <termo_antigo> por <termo_novo> na linha atual.
- ​:%s/<termo_antigo>/<termo_novo>/g - Faz a mesma substituição, mas em todo o arquivo (o %` significa "em todas as linhas").
- ​:%s/<termo_antigo>/<termo_novo>/gc - Faz a mesma substituição globalmente, mas com confirmação para cada ocorrência (c` de "confirm").

### ​Histórico

- ​:undo - Desfaz a última alteração.
- ​:redo - Refaz a última alteração desfeita.
- ​:earlier <tempo> - Volta no tempo. Por exemplo, :earlier 10m desfaz todas as alterações dos últimos 10 minutos.
- ​:later <tempo> - Avança no tempo. Por exemplo, :later 5s refaz as alterações dos últimos 5 segundos.

​O nvim tem muitos outros comandos, mas esses são os que considero mais essenciais

---

Comandos_Cli_para_Nvim
- limpar_Cache_Nvim_sem_Configuracao: `nvim --clean # Isso abre o Neovim sem nenhuma configuração, limpa o cache # disponivel tambem em mysh: nvimPuro()`

---

No_Commandline
- Atualizar_plugins_novos_lazyvim: no cmd >> :`Lazy sync`
- Checkar_se_funciona_toogle_NvimTreeToggle: no cmd >> : `NvimTreeToggle`
- checkar_tipo_do_arquivo: :`set ft?`
- checkar_um_plugin: :`checkhealth <NomePlugin>` # exemplo: :`checkhealth nvim-cmp`
- checkar_uo_print_em_um_package_plugin: :`lua print(package.loaded.<NomePlugin>)` # exemplo: :`lua print(package.loaded.cmp)`
- escreve_o_tipo_do_arquivo_em_foco: :`echo &filetype`
---

- Expandir_Snippets: e navegar pelos placeholders Ctr+Tab

---
- limpar_profundamente_cache_lazyvim: `rm -rf ~/.local/share/nvim/lazy/`

---
Uses
- usar_abreviacoes: "Digite `fms` (ou o prefixo que você escolher) e pressione Espaço ou Enter. A frase será inserida."
- copiar_conteudos_extensos_depuracoes
  - PrimeirLinha: gg >> SelecioneTudo: V >> Ir_ate_UltimaLinhaSelecionado : G  >> Copiar: yy
  - Passos_Arquivo_Depurar_Messages:
    - ```
    :redir > ~/nvim_messages.log
    :messages
    :redir END
    :echo "Mensagens salvas em ~/nvim_messages.log"
```
Navegador
Nek tree e configurar outros:


---
Atalhos e Ferramentas do Neo-tree
Aqui está uma lista dos atalhos e das principais funcionalidades do neo-tree para você dominar a navegação.

Atalhos Comuns (Dentro da Árvore de Arquivos)
Atalho	Ação
l ou <CR>	Abrir o arquivo ou entrar no diretório.
h	Subir um nível de diretório.
j	Mover para baixo.
k	Mover para cima.
a	Criar um novo arquivo ou diretório.
d	Deletar o arquivo ou diretório selecionado.
r	Renomear o arquivo ou diretório.
s	Copiar o arquivo ou diretório.
p	Colar o arquivo ou diretório.
?	Mostrar a ajuda (lista de atalhos).

Exportar para as Planilhas
Principais Ferramentas e Funcionalidades
Modo Flutuante: O modo que você já amou! Permite abrir e fechar a árvore de arquivos como uma janela pop-up, sem alterar o layout da sua tela.

Integração com Git: Exibe o status do Git para cada arquivo e diretório (modificado, adicionado, ignorado, etc.).

Ícones de Arquivos: Usa o nvim-web-devicons para mostrar ícones bonitos e relevantes para cada tipo de arquivo.

Bookmarks (Marcadores): Permite que você marque diretórios e arquivos importantes para acessá-los rapidamente mais tarde.

Filtros: Oferece a capacidade de ocultar ou mostrar arquivos com base em padrões, como arquivos ocultos (.dotfiles) ou arquivos ignorados pelo .gitignore.

Alternar entre Modos: O neo-tree tem outros modos além da visualização de arquivos, como o de buffers abertos e de lista de histórico do Git.

---


