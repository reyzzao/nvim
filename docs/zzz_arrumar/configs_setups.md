
---
### Init Root - Porta de Entrada
- carregar o gerenciador de plugins sempre primeiro.
	- Pense no init.lua como o ponto de partida que diz ao LazyVim "Ei, carregue todos os plugins que eu configurei!". O LazyVim, então, se encarrega de ler a lista de plugins e as configurações de cada um.
- 


---


Considerações Importantes:
Ctrl+Tab para Snippets vs. Buffers: Você mencionou Ctrl+Tab para navegar em snippets. No Neovim, Ctrl+Tab é mais comumente usado para navegação entre buffers (como você já tinha mapeado). Os snippets (com nvim-cmp e LuaSnip) são expandidos e navegados com Tab e Shift+Tab. Mantive o Ctrl+Tab para buffers para evitar conflitos diretos e seguir o padrão mais comum.

---
Refatoracoes
- Se for renomear diretorios, cuidado com caracteres em arquivos de plugins
  - exemplo: em telescope , a linha `nvim-lua/plenary.nvim` deu problema ao fazer replace de lua/ porque aqui chama um repo e nao um diretorio da app nvim.
-

---

