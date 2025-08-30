-- @file: ~/.config/nvim/lua/plugins/gemini.lua

return {
  "nvim-lua/plenary.nvim",
  name = "Gemini",
  -- Remove a secao de 'dependencies' daqui
  
  -- Usa o atalho como gatilho para carregar o plugin
  keys = {
    { "<leader>pg", ":GeminiGenerate<CR>", mode = { "n", "v" }, desc = "Gerar conteudo com Gemini" },
  },
  -- A funcao 'config' so e executada apos as dependencias serem carregadas
  config = function()
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

    local function generate_content()
      local selected_text
      if vim.api.nvim_get_mode().mode == "v" then
        selected_text = vim.fn.getreg('"')
      else
        vim.notify("Nenhum texto selecionado. Selecione algo em modo visual primeiro.", vim.log.levels.INFO)
        return
      end

      if not selected_text or selected_text:len() == 0 then
        vim.notify("Nenhum texto selecionado. Selecione algo em modo visual primeiro.", vim.log.levels.INFO)
        return
      end

      vim.notify("Gerando conteúdo com Gemini...", vim.log.levels.INFO)

      vim.uv.new_thread(function()
        local response_data = gemini_api_request(selected_text)
        if response_data and response_data.candidates and #response_data.candidates > 0 then
          local generated_text = response_data.candidates[1].content.parts[1].text
          vim.schedule(function()
            vim.api.nvim_buf_set_text(0, vim.fn.line("."), vim.fn.col(".") - 1, vim.fn.line("."), vim.fn.col(".") - 1, vim.split(generated_text, "\n"))
            vim.notify("Conteúdo gerado e inserido!", vim.log.levels.INFO)
          end)
        else
          vim.schedule(function()
            vim.notify("Nenhuma resposta válida recebida da API.", vim.log.levels.WARN)
          end)
        end
      end)
    end
    
    -- Cria o comando de editor 'GeminiGenerate'
    vim.api.nvim_create_user_command(
      "GeminiGenerate",
      generate_content,
      { nargs = 0, desc = "Gerar conteudo com Gemini" }
    )
  end,
}