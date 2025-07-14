-- ~/.config/nvim/lua/custom/keymaps/abreviations.lua


-- --- Abreviações (Substituições de Texto) ---
-- As abreviações funcionam no modo de inserção (i) e no modo de comando (c).
-- Elas inserem texto literal e não possuem placeholders como snippets de plugin.

vim.cmd("iabbrev hellow function helloWorld() {\\n  console.log('Hello, World!');\\n}")
vim.cmd("iabbrev fms function minhaFuncaoSoma(a, b")
vim.cmd("iabbrev soma_raiz function sum(num1, num2) {\\n  return num1 + num2;\\n}")
-- vim.cmd("iabbrev sig -- Rzj") -- Exemplo: sua assinatura