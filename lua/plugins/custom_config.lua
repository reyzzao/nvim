-- @file: ~/.config/nvim/lua/plugins/custom_config.lua

return {
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-lualine/lualine.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-telescope/telescope.nvim",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
    },
  },
  {
    "ray-x/lsp_signature.nvim",
  },
  {
    "numToStr/Comment.nvim",
  },
  {
    "ggandor/leap.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
    "https://github.com/LuaDist/dkjson.git",
    name = "Gemini",
    event = "VimEnter",
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
      local function generate_content(prompt)
        vim.notify("Gerando conteúdo com Gemini...", vim.log.levels.INFO)
        vim.uv.new_thread(function()
          local response_data = gemini_api_request(prompt)
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
      vim.api.nvim_create_user_command(
        "GeminiGenerate",
        function()
          local selected_text = ""
          if vim.api.nvim_get_mode().mode == "v" then
            selected_text = vim.fn.getreg('"')
          end
          vim.ui.input({ prompt = "Prompt Gemini: " }, function(input)
            if input and input ~= "" then
              local full_prompt = input
              if selected_text ~= "" then
                full_prompt = full_prompt .. "\n\nCódigo:\n" .. selected_text
              end
              generate_content(full_prompt)
            end
          end)
        end,
        { nargs = 0, desc = "Gerar conteudo com Gemini" }
      )
    end,
    keys = {
      { "<leader>pg", ":GeminiGenerate<CR>", mode = { "n", "v" }, desc = "Gerar conteudo com Gemini" },
    },
  },
}