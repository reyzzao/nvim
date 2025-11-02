
---
Obrigado por compartilhar o vídeo. A sua intuição está absolutamente correta. A abordagem mostrada no vídeo, que usa Telescope em conjunto com o comando :cdo, é a melhor e mais confiável solução para substituições globais em múltiplos arquivos.
Esta técnica é superior ao script que você estava usando e ao spectre.nvim porque ela:
 * É nativa do Neovim: O comando :cdo é uma funcionalidade padrão, o que o torna extremamente estável e rápido.
 * É segura: Você pode inspecionar todos os resultados da busca no quickfix list do Neovim antes de executar o comando de substituição.
 * É integrada: O Telescope (que já vem com o LazyVim) lida com a busca de forma eficiente, e o Neovim lida com a execução do comando.
Como usar o fluxo de trabalho Telescope + cdo
 * Busque por um termo:
   * Use o atalho <leader>fw para buscar a palavra sob o seu cursor em todos os arquivos.
   * Use o atalho <leader>fg para buscar um termo que você digitar.
 * Abra o quickfix list:
   * Após a busca, o Telescope vai mostrar a lista de resultados. Pressione <CR> para confirmar, e os resultados serão populados no quickfix list. Você pode abri-lo com o comando :copen para inspecionar os resultados.
 * Execute a substituição global:
   * Para substituir o termo em todos os arquivos da lista de resultados, use o seguinte comando:
   <!-- end list -->
   :cdo s/termo_antigo/termo_novo/g | update

   * cdo: Executa um comando em cada item da lista do quickfix.
   * s/termo_antigo/termo_novo/g: É o comando de substituição.
   * g: Garante que todas as ocorrências na linha sejam substituídas.
   * | update: Salva as alterações feitas no arquivo.
Simplificando com um Atalho
Para tornar este fluxo de trabalho ainda mais rápido, podemos criar um atalho que executa tudo isso para você. Adicione esta função ao seu arquivo ~/.config/nvim/lua/config/keymaps.lua.
-- Adiciona um mapeamento para substituicao global usando cdo
map('n', '<leader>R', function()
    -- Pede o termo de busca e o termo de substituicao
    local search_term = vim.fn.input("Buscar por: ")
    local replace_term = vim.fn.input("Substituir por: ")

    if search_term == "" or replace_term == "" then
        print("Substituição cancelada.")
        return
    end

    -- Realiza a busca com o Telescope e popula o quickfix list
    require('telescope.builtin').grep_string({ search = search_term })

    -- Executa a substituicao em todos os arquivos do quickfix list
    vim.cmd('cdo s/' .. search_term .. '/' .. replace_term .. '/g | update')
    print("Substituição global concluida. Verifique os arquivos modificados.")
end, { desc = 'Substituição Global com Telescope' })

Com este atalho, basta pressionar <leader>R e digitar os termos para a busca e substituição, e ele fará o resto.

---
