
---

Ótima pergunta! A "mágica" do Neovim reside justamente em sua capacidade de combinar comandos nativos para realizar tarefas complexas, muitas vezes eliminando a necessidade de um plugin.
Aqui estão alguns comandos e conceitos que, quando combinados, funcionam como verdadeiros superpoderes.
1. Comandos de Lista Rápida (quickfix e location)
Você já viu o poder do :cdo, que atua sobre o quickfix list (lista de resultados de busca, erros de linter, etc.). O quickfix list é global para todas as janelas. Mas existe um "irmão" dele:
 * :ldo: Similar ao :cdo, mas opera no location list. Este é um quickfix list local, específico para a janela onde você o criou. É perfeito para buscas e substituições em um subconjunto de arquivos ou para gerenciar erros de um único linter.
   * Exemplo: Use :lgrep termo para buscar a palavra em todos os arquivos e depois use :ldo s/termo/novo/g para substituir apenas nos resultados da janela atual.
2. Manipulação de Argumentos (argdo)
O comando :argdo é uma versão do :cdo que age sobre a arglist, uma lista de arquivos que você define manualmente. Isso é mais confiável que o script de busca com ripgrep que vimos antes.
 * :argadd {arquivos}: Adiciona arquivos à lista.
 * :argdo {comando}: Executa um comando em cada arquivo da lista.
 * Exemplo: Para substituir uma string em todos os arquivos .js no diretório atual:
   * :argadd *.js (Adiciona todos os arquivos .js à arglist)
   * :argdo %s/antigo/novo/g | update (Executa a substituição e salva cada arquivo)
3. Comandos de Global (:g e :v)
Estes são os mais poderosos para manipular texto. Eles executam um comando em todas as linhas que correspondem (ou não) a um padrão.
 * :g/{padrão}/{comando}: Executa um comando em todas as linhas que contêm o padrão.
   * Exemplo: Para apagar todas as linhas com a palavra debug em um arquivo: :g/debug/d
 * :v/{padrão}/{comando}: Executa um comando em todas as linhas que NÃO contêm o padrão.
   * Exemplo: Para apagar todas as linhas vazias (exceto as que contêm a palavra keep): :v/keep/d
4. Macros (q)
As macros são a "mágica" para automatizar tarefas repetitivas. Você grava uma sequência de comandos e a reproduz quantas vezes quiser.
 * q{registro}: Começa a gravar uma macro no registro {registro} (por exemplo, qa).
 * q: Para a gravação.
 * @{registro}: Executa a macro uma vez.
 * {número}@{registro}: Executa a macro {número} de vezes.
 * Exemplo: Para adicionar um // no início de cada linha de uma função:
   * Mova o cursor para a primeira linha da função.
   * Pressione qa para começar a gravar no registro 'a'.
   * Pressione I//<Esc> para inserir // no início da linha.
   * Pressione j para ir para a próxima linha.
   * Pressione q para parar a gravação.
   * Pressione @{número_de_linhas}a para repetir a macro em todas as linhas restantes.
Dominar estes comandos é o verdadeiro segredo para ter uma experiência de edição poderosa e produtiva sem depender de muitos plugins.


SOBRE MULT CURSOR
Uma ótima pergunta. Essa é uma das maiores curiosidades de quem vem de outros editores como o VS Code.
No Neovim, não existe um "cursor múltiplo" como em outros editores, onde você vê vários cursores piscando. Em vez disso, o Neovim usa a filosofia do modo visual e das macros para atingir o mesmo resultado de uma forma ainda mais poderosa.
As duas principais técnicas nativas para isso são:
1. Modo Visual em Bloco (<C-v>)
Este é o equivalente mais próximo ao multi-cursor. Ele permite que você selecione um bloco retangular de texto e execute um único comando nele.
 * Para inserir texto em várias linhas:
   * Vá para a linha onde você quer começar a inserir.
   * Pressione <C-v> (Ctrl + v) para entrar no modo Visual em Bloco.
   * Use j ou as setas para baixo para selecionar as linhas desejadas.
   * Pressione I (i maiúsculo) para entrar no modo de inserção.
   * Digite o texto que você quer inserir. Ele só vai aparecer na primeira linha, mas não se preocupe.
   * Pressione <Esc> (escape). O texto que você digitou será magicamente copiado para todas as linhas selecionadas.
2. Macros (q)
As macros são ainda mais flexíveis que o modo visual em bloco. Você pode gravar uma sequência de comandos e aplicá-la em qualquer lugar, mesmo se as linhas forem diferentes. Por exemplo, você pode gravar uma macro que remove uma vírgula e adiciona um ponto e vírgula, e depois executá-la em todas as linhas.
Embora um plugin como vim-multiple-cursors possa replicar a sensação visual do VS Code, dominar o modo visual em bloco e as macros é o verdadeiro "superpoder" do Neovim, pois eles são mais rápidos e eficientes para a maioria das tarefas.

---
