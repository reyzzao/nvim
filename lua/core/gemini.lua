-- @file: lua/core/gemini.lua

local M = {}
local json = require("dkjson")
local http = require("plenary.async.http")
local API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent"

local function gemini_api_request(prompt)
  local api_key = vim.env.GOOGLE_API_KEY
  if not api_key then
    vim.notify("Chave da API do Google não encontrada. Verifique sua variavel de ambiente.", vim.log.levels.WARN)
    return nil
  end

  local request_body = {
    contents = {
      {
        parts = {
          {
            text = prompt,
          },
        },
      },
    },
  }

  local headers = {
    ["Content-Type"] = "application/json",
  }
  local url_with_key = string.format("%s?key=%s", API_URL, api_key)
  local ok, response = pcall(http.post, url_with_key, {
    body = json.encode(request_body),
    headers = headers,
    timeout = 15,
  })

  if not ok or not response or response.status ~= 200 then
    vim.notify("Erro ao chamar a API do Gemini. Codigo: " .. (response and response.status or "n/a"), vim.log.levels.ERROR)
    return nil
  end

  local response_data, err = json.decode(response.body)
  if err then
    vim.notify("Erro ao decodificar a resposta da API.", vim.log.levels.ERROR)
    return nil
  end
  return response_data
end

local function insert_generated_text(text)
  vim.api.nvim_buf_set_text(0, vim.fn.line("."), vim.fn.col(".") - 1, vim.fn.line("."), vim.fn.col(".") - 1, vim.split(text, "\n"))
  vim.notify("Conteúdo gerado e inserido!", vim.log.levels.INFO)
end

function M.generate_from_prompt()
  local user_input = vim.fn.input("Prompt Gemini: ")

  if user_input ~= "" then
    vim.notify("Gerando conteúdo com Gemini...", vim.log.levels.INFO)
    vim.uv.new_thread(function()
      local response_data = gemini_api_request(user_input)
      if response_data and response_data.candidates and #response_data.candidates > 0 then
        insert_generated_text(response_data.candidates[1].content.parts[1].text)
      else
        vim.schedule(function()
          vim.notify("Nenhuma resposta válida recebida da API.", vim.log.levels.WARN)
        end)
      end
    end)
  else
    vim.notify("Operação cancelada.", vim.log.levels.INFO)
  end
end

function M.generate_from_code()
  local start_line = vim.api.nvim_buf_get_mark(0, "[")[1]
  local end_line = vim.api.nvim_buf_get_mark(0, "]")[1]
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local selected_text = table.concat(lines, "\n")
  
  if not selected_text or selected_text:len() == 0 then
    vim.notify("Nenhum texto selecionado. Selecione algo em modo visual primeiro.", vim.log.levels.INFO)
    return
  end
  
  local user_input = vim.fn.input("Prompt para o codigo: ")
  
  if user_input ~= "" then
    local full_prompt = user_input .. "\n\nCódigo:\n" .. selected_text
    vim.notify("Gerando conteúdo com Gemini...", vim.log.levels.INFO)
    vim.uv.new_thread(function()
      local response_data = gemini_api_request(full_prompt)
      if response_data and response_data.candidates and #response_data.candidates > 0 then
        insert_generated_text(response_data.candidates[1].content.parts[1].text)
      else
        vim.schedule(function()
          vim.notify("Nenhuma resposta válida recebida da API.", vim.log.levels.WARN)
        end)
      end
    end)
  else
    vim.notify("Operação cancelada.", vim.log.levels.INFO)
  end
end

return M