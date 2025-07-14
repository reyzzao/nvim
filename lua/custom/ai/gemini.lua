-- ~/.config/nvim/lua/custom/custom/ai/gemini.lua

local M = {}

-- --- Configurações da API Gemini ---
local GEMINI_API_KEY = vim.env.GEMINI_API_KEY or ""
local GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=" .. GEMINI_API_KEY

-- --- Definição dos Modos de IA ---
M.modes = {
    Tutor = "Você é um tutor de programação paciente e experiente. Explique conceitos de forma clara, forneça exemplos detalhados e responda a perguntas como se estivesse ensinando um iniciante. Priorize a compreensão.",
    Assistente = "Você é um assistente de codificação conciso e eficiente. Forneça soluções diretas, refatore códigos, complete trechos e responda a perguntas técnicas de forma objetiva. Vá direto ao ponto.",
    Agente = "Você é um agente de resolução de problemas de software altamente qualificado e proativo. Analise problemas complexos, depure código, sugira otimizações e implemente soluções robustas. Pense fora da caixa e seja decisivo.",
}

M.current_mode = "Assistente"

function M.set_mode(mode_name)
    if M.modes[mode_name] then
        M.current_mode = mode_name
        vim.notify("Modo Gemini alterado para: " .. mode_name, "INFO", { title = "Gemini AI" })
    else
        vim.notify("Modo Gemini '" .. mode_name .. "' não encontrado.", "WARN", { title = "Gemini AI" })
    end
end

local function get_context()
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'v' or mode == 'V' or mode == 'CTRL-V' then
        local start_pos = vim.api.nvim_buf_get_mark(0, '<')
        local end_pos = vim.api.nvim_buf_get_mark(0, '>')
        local lines = vim.api.nvim_buf_get_lines(0, start_pos[1] - 1, end_pos[1], false)
        return table.concat(lines, '\n')
    else
        return table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
    end
end

function M.ask(user_prompt)
    if GEMINI_API_KEY == "" then
        vim.notify("Erro: GEMINI_API_KEY não configurada.", "ERROR", { title = "Gemini AI" })
        return
    end

    local context = get_context()
    local system_prompt = M.modes[M.current_mode] or M.modes.Assistente

    local full_prompt = string.format("%s\n\nContexto do Código:\n```\n%s\n```\n\nMinha Pergunta:\n%s",
                                      system_prompt, context, user_prompt)

    local payload = {
        contents = {
            {
                role = "user",
                parts = {
                    { text = full_prompt }
                }
            }
        },
        generationConfig = {
            temperature = 0.7,
        }
    }

    vim.notify("Enviando para Gemini (" .. M.current_mode .. ")...", "INFO", { title = "Gemini AI" })

    local curl_cmd = {
        "curl", "-X", "POST",
        "-H", "Content-Type: application/json",
        "-d", vim.fn.json_encode(payload),
        GEMINI_API_URL
    }

    local output_lines = {}
    local job_id = vim.fn.jobstart(curl_cmd, {
        on_stdout = function(_, data, event)
            for _, line in ipairs(data) do
                table.insert(output_lines, line)
            end
        end,
        on_stderr = function(_, data, event)
            vim.notify("Erro na requisição Gemini: " .. table.concat(data, "\n"), "ERROR", { title = "Gemini AI" })
        end,
        on_exit = function(job_id, code, event)
            if code == 0 then
                local response_json = table.concat(output_lines, "\n")
                local success, result = pcall(vim.fn.json_decode, response_json)

                if success and result and result.candidates and result.candidates[1] and result.candidates[1].content and result.candidates[1].content.parts and result.candidates[1].content.parts[1] then
                    local ai_response = result.candidates[1].content.parts[1].text
                    M.display_response(ai_response)
                else
                    vim.notify("Erro ao processar resposta Gemini: " .. response_json, "ERROR", { title = "Gemini AI" })
                end
            else
                vim.notify("Requisição Gemini falhou com código: " .. code, "ERROR", { title = "Gemini AI" })
            end
        end,
        stdout_buffered = true,
        stderr_buffered = true,
    })

    if job_id == 0 then
        vim.notify("Falha ao iniciar o job curl para Gemini.", "ERROR", { title = "Gemini AI" })
    end
end

function M.display_response(response_text)
    vim.cmd("vsplit")
    vim.cmd("enew")
    vim.cmd("setlocal buftype=nofile bufhidden=wipe nobuflisted nospell wrap")
    vim.cmd("setlocal filetype=markdown")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(response_text, '\n'))
    vim.notify("Resposta Gemini recebida!", "INFO", { title = "Gemini AI" })
end

return M
