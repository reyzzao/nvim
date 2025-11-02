
---
### Opcoes_ao_Acionar_Menu_Lazy_sync

U (Update): 
Este é o comando para atualizar todos os seus plugins para a versão mais recente disponível no repositório. O Lazy.nvim verifica cada plugin e baixa a última versão que ele encontra. É o comando principal para manter tudo atualizado.

S (Sync): 
O sync é mais poderoso do que o update. Ele faz uma "sincronização" completa, que inclui:
Instalação: Instala quaisquer novos plugins que você adicionou ao seu arquivo de configuração lazy.lua.
Atualização: Atualiza os plugins existentes para as versões mais recentes (igual ao U).
Remoção: Remove plugins que você excluiu do seu arquivo de configuração.
Basicamente, o sync garante que o estado dos seus plugins no disco corresponda exatamente ao que está no seu arquivo de configuração.


---