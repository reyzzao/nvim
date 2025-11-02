
---
Resumo de Configuração e Atalhos no Neovim
1. Filosofia de Trabalho (init.lua)

Melhoria: A init.lua agora está estruturada para carregar plugins e configurações de forma modular, permitindo que você adicione ou remova funcionalidades facilmente.

O que isso te dá: Um plano de configuração escalável e organizado, alinhado com a sua filosofia de "código limpo" e preparada para o futuro.

2. Plugins e Funcionalidades
- invoque as funções de configuração de plugins no plugin/init.lua, ao invés de super lotar de requeres o init root.

Gitsigns: Plugin para visualização de mudanças do Git na 'gutter' (coluna lateral do editor).

O que isso te dá: Feedback visual instantâneo sobre o status do seu código, sem a necessidade de comandos adicionais.

Melhoria recente: A configuração foi ajustada para remover o word-highlight constante e corrigir o comportamento do blame, seguindo suas preferências.

Conform.nvim: Novo plugin para formatação automática de código.

O que isso te dá: Formatação consistente e automática ao salvar o arquivo, resolvendo o problema que você identificou. Isso elimina o "code smell" de formatação e economiza seu tempo.

Lazy.nvim: Gerenciador de plugins que garante o carregamento otimizado.

O que isso te dá: Um Neovim mais rápido e leve, pois os plugins só são carregados quando necessários.

LSP (Language Server Protocol): Configuração de servidores de linguagem para diversas tecnologias.

O que isso te dá: Funcionalidades de IDE como autocompletar, 'go-to-definition', 'hover-documentation' e refatoração, tudo dentro do Neovim.


---
Design
- Novo_tema: a cada novo tema, para aproveotar só as cores do texto, use o fundo do terminal kitty:
- No arquivo de configuracao do tema defina:
  - transparent_background = true no Tema, dissemos ao tema para não definir seu próprio fundo. Com isso, o Neovim "passou o controle" do fundo para o terminal. 
  - kitty:  ~/.config/kitty/kitty.conf, o Kitty está aplicando a cor como o fundo da janela.
---
ZZZZ ARRUMAR

### My Nvim com Lazyvim

Configs_Atuais
- Tema_em_Uso: 
  - Configuracao Tutorial by Gmn: [Link ](https://g.co/gemini/share/2bc1c4ad5b95)
  -Tema_Dracula: Para mudar o fundo do Neovim: Edite custom_background_hex em ~/.config/nvim/lua/plugins/dracula.lua.
  - Tema_Catppuccin: se um dia você ativar o Catppuccin (enabled = true), você precisaria consultar a documentação dele ou procurar por opções de configuração de fundo dentro da tabela de setup do plugin para personalizá-lo. Mas a capacidade de controlar o fundo está lá, sim!

- Mudar_Cor_de_Fundo: em : `lua/config/custom_highlights.lua` procure por #editable : local custom_background_hex = "#" -- <--- #editable: AQUI DEFINE O FUNDO DO EDITOR no: [ kitty, ] 
- 

---

---

Status
- Cursor_Voltar_Onde_parou: true (padrao)
- Plugins/exemple : nao configura nada é só exemplo
- Lsp: o `plugins/lsp.lua` depende de `require('lsp.servers')` # para configurar meus lsp customizados.
- snippets: `"/lua/snippets"` # criar pasta snippets em lua/ para ter meus snippets que sao puxados em `/plugins/luasnip.lua` # TODO CRIAR UNS SNIPPETS 

---
