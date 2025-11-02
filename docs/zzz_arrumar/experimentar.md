
---
-- SUBSTITUIÇÃO TODAS OCORRENCIAS DIGITADAS =>  NO ARQUIVO --
-- para usar execute o atalho -> volte uma barra com a seta e digite A PROCURA -> após a proxima barra digite o que  vai substituir a procura encontrada
vim.cmd([[
  nnoremap <A-s> :%s///g<Left><Left>
  nnoremap <A-sc> :%s///gc<Left><Left><Left>

  xnoremap <A-s> :s///g<Left><Left>
  xnoremap <A-sc> :s///gc<Left><Left><Left>

  vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

]])

---
Mais utilidades no backup Astrobim (https://github.com/reyzzao/wbackups/blob/main/nvim_modelos%2FASTRO_Modificado_24%2Fnvim%2Flua%2Fmaps%2FmapsFunctions.lua)