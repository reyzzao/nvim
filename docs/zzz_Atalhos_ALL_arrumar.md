
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
