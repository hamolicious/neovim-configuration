if (IsCurrentPlatformOneOf(Platform.WORK_MAC)) then
  return {
    provider = 'openai',
    provider_options = {
      openai = {
        model = 'gpt-4o-mini',
        -- system = "see [System Prompt] section for the default value",
        -- few_shots = "see [System Prompt] section for the default value",
        stream = true,
        optional = {
          stop = { 'end' },
          max_tokens = 256,
          -- top_p = 0.9,
        },
      },
    },
  }
elseif (IsCurrentPlatformOneOf(Platform.UBUNTU_PC)) then
  return {
    provider = 'openai_compatible',
    provider_options = {
      openai_compatible = {
        model = 'codellama:7b',
        end_point = 'http://localhost:11434/v1/chat/completions',
        api_key = 'EDITOR',
        name = 'codellama',
        system = '[INST] <<SYS>>{{ .System }}<</SYS>>\n\n{{ .Prompt }} [/INST]',
        stream = false,
        optional = {
          rope_frequency_base = 1000000,
          stop = {
            "[INST]",
            "[/INST]",
            "<<SYS>>",
            "<</SYS>>"
          }
        }
      },
      -- openai_compatible = {
      --   model = 'mistral',
      --   end_point = 'http://localhost:11434/v1/chat/completions',
      --   api_key = 'EDITOR',
      --   name = 'mistral',
      --   stream = false,
      --   optional = {
      --     stop = nil,
      --     max_tokens = nil,
      --   },
      -- }
    }
  }
end
