return {
  'milanglacier/minuet-ai.nvim',
  config = function()
    local customProviderOptions = require('platform.llm-provider')

    local setupTable = {
      throttle = 1000,   -- ms
      debounce = 400,    -- ms
      cmp = {
        enable_auto_complete = true,
      },
      blink = {
        enable_auto_complete = false,
      },
      virtualtext = {
        auto_trigger_ft = { '*' },
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

    for k, v in pairs(customProviderOptions) do
      ---@diagnostic disable-next-line: assign-type-mismatch
      setupTable[k] = v
    end

    require('minuet').setup(setupTable)
  end
}
