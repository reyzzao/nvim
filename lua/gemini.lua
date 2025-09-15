
-- @file: lua/gemini.lua
-- @mission: Plugin para Neovim que se comunica com a API do Google Gemini.

local M = {}

M.API_BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/"

---@mission Configura o plugin com as opções fornecidas pelo usuário.
---@param opts Config Opções de configuração para a API do Gemini.
function M.setup(opts)
  M.config = opts
end

---
---@mission Envia uma requisição para a API do Gemini com o conteúdo do buffer e a consulta do usuário.
---@param query string A consulta ou comando a ser enviado para o modelo.
---@return table A resposta da API, incluindo o texto gerado e metadados.
function M.prompt(query)
  local buffer_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local prompt_text = table.concat(buffer_content, "\n") .. "\n\n" .. query

  local model = M.config.model or "gemini-1.5-flash-latest"

  local payload = {
    contents = {
      {
        parts = {
          {
            text = prompt_text
          }
        }
      }
    }
  }

  local headers = {
    ["Content-Type"] = "application/json",
  }

  local url = M.API_BASE_URL .. model .. ":generateContent?key=" .. M.config.API_KEY

  -- Faz a requisicao HTTP e retorna a resposta
  local response = vim.fn.http_request(url, {
    method = "POST",
    headers = headers,
    body = vim.json.encode(payload)
  })

  return response
end

return M
