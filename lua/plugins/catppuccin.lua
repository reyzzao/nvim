-- ~/.config/nvim/lua/plugins/catppuccin.lua

-- Desativa explicitamente o Catppuccin se o LazyVim estiver tentando carregá-lo por padrão.
return {
  "catppuccin/nvim",
  enabled = false, -- <--- ESTA LINHA É A CHAVE PARA DESATIVÁ-LO
}
