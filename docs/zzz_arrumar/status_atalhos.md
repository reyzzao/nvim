
---
Conceito_Atalhos
- Com prefixos separe os níveis de Atalhos.
- Níveis de atalhos: 
  - projeto : (interfere ao codar ex: code, arquivos salvar,  ), prefixo: leader>p +
  - editor : (interfere no editor, ex: [terminal, Explorer, navegações, pesquisas ])prefixo: leader>e +
  - configuracoes: ( interfere: [insercoes em arquivos, ex: add header endereco])  prefixo: leader>c +
  - externos: (interfere em [git, runtimes]

---
3. Novos Atalhos de Teclado

prefixo p :

renomear_simbolo: leader + r (fncionando ok)
subistituir_texto_global: leader + n





Navegação entre Buffers:

C-j: Pular para o próximo buffer.

C-k: Pular para o buffer anterior.

Via_Command_Line
- Inserir Cabeçalho (Header): :`InsertHeader` 

Atalhos

- by Github (gitsigns):

<leader>gn: Pular para a próxima alteração (hunk).
<leader>gp: Pular para a alteração anterior (hunk).
<leader>gs: stage (preparar) a alteração atual.
<leader>gr: reverter a alteração atual.
<leader>gS: stage todo o buffer.
<leader>gR: reverter todo o buffer.
<leader>gv: preview a alteração.
<leader>gb: blame (mostra o commit que alterou a linha), agora de forma persistente.

Ações de Edição:

<leader>c: Limpar o texto selecionado (comentar/descomentar).

Terminal
<leader>tv: Toogle terminal vertical do lado direito.

---