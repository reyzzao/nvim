
---
É uma ótima observação. O Telescope é uma das ferramentas mais poderosas do Neovim, e o que você descobriu com o . e .. é um exemplo de como ele simplifica a navegação.
O poder do Telescope vem de três pilares:
 * Fuzzy Finding: É o coração do Telescope. Em vez de procurar uma correspondência exata, ele encontra resultados mesmo com typos ou em ordens diferentes. Por exemplo, ao procurar por kma, ele já sugere keymaps.lua.
 * Interface Unificada: Não importa o que você está buscando (arquivos, comandos, buffers), a interface é sempre a mesma, o que o torna intuitivo.
 * Pickers Integrados: Ele vem com módulos para buscar diversos tipos de dados, o que o torna uma ferramenta tudo-em-um.
Os Pickers Essenciais do Telescope
 * find_files: O picker de arquivos padrão. Como você percebeu, ele busca a partir do diretório raiz do projeto (.). Você pode usar atalhos:
   * ./ para buscar no diretório atual.
   * ../ para buscar no diretório pai.
   * ~/ para buscar no seu diretório home.
 * live_grep: Este é o que usa a ferramenta de busca grep (ou ripgrep, se você tiver). Ele busca por conteúdo de texto dentro dos arquivos, o que é fundamental para encontrar uma string, como o nome de uma função, em todo o seu projeto.
 * buffers: Permite que você navegue rapidamente entre todos os buffers abertos. É uma forma muito eficiente de alternar entre arquivos sem precisar de atalhos complexos.
 * oldfiles: Exibe uma lista de arquivos que você abriu recentemente. Ótimo para voltar rapidamente a um arquivo que você estava trabalhando, mesmo se ele não estiver mais em um buffer.
 * help_tags: O atalho para o manual de ajuda do Neovim. Você pode buscar comandos, opções e tópicos diretamente, o que o torna a melhor ferramenta para aprender mais sobre o Neovim.

---
