

# Debug Golang :

### Fluxo de DebugInstale os plugins:
- apos configurar o arquivo lua/plugins/Dap.
 
nvim-dap-go e nvim-dap-ui.Defina o Breakpoint: Abra seu arquivo Go e use o atalho <leader>b (por padrão, <space>b)
na linha que você quer pausar.Inicie o Debug: Use <leader>dc (por padrão, <space>dc) para iniciar a sessão.

O nvim-dap-go irá usar o dlv para compilar, iniciar a sessão de debug e conectar o Neovim. 
A interface do nvim-dap-ui será aberta mostrando variáveis, stack trace e janelas de observação.

O DAP simplifica o debug, mas cada linguagem exige um Adaptador (como o dlv para Go). 
Se você fosse debugar JavaScript/TypeScript, precisaria do nvim-dap-vscode-js, por exemplo.

---
