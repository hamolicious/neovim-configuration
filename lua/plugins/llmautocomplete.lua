return {
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
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

        cmp = {
          enable_auto_complete = true,
        },
        blink = {
          enable_auto_complete = false,
        },
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            accept = '<Tab>',
            dismiss = '<S-Tab>',
            accept_line = '<A-Tab>',
            -- Cycle to prev completion item, or manually invoke completion
            prev = '<A-[>',
            -- Cycle to next completion item, or manually invoke completion
            next = '<A-]>',
          },
        },
      }
    end
  },
}
