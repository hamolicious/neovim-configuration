local function clear_key_bind(key, action)
  vim.api.nvim_del_keymap(key, action)
end

return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    -- Custon Keys
    local continue_key = 'gr'
    local step_into_key = 'gi'
    local step_out_key = 'go'

    local dap = require("dap")
    local dapui = require("dapui")

    -- Icons
    vim.fn.sign_define('DapBreakpoint', {
      text = '🔴', -- Replace with your desired symbol
      texthl = '', -- Highlight group (optional)
      linehl = '', -- Line highlight group (optional)
      numhl = '' -- Number highlight group (optional)
    })

    vim.fn.sign_define('DapBreakpointRejected', {
      text = '⚫', -- Replace with your desired symbol
      texthl = '', -- Highlight group (optional)
      linehl = '', -- Line highlight group (optional)
      numhl = '' -- Number highlight group (optional)
    })

    vim.fn.sign_define('DapStopped', {
      text = '👉', -- Replace with your desired symbol
      texthl = '', -- Highlight group (optional)
      linehl = '', -- Line highlight group (optional)
      numhl = '' -- Number highlight group (optional)
    })


    -- Setup
    dapui.setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = ""
        }
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" }
        }
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.25
        }, {
          id = "breakpoints",
          size = 0.25
        }, {
          id = "stacks",
          size = 0.25
        }, {
          id = "watches",
          size = 0.25
        } },
        position = "left",
        size = 40
      }, {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 10
      } },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
    })

    -- Keybinds
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()

      vim.keymap.set({ 'n', }, continue_key, '<cmd> DapContinue <CR>',
        { desc = 'Debugger Continue', silent = true, noremap = true })

      vim.keymap.set({ 'n', }, step_into_key, '<cmd> DapStepInto <CR>',
        { desc = 'Debugger Step Into', silent = true, noremap = true })

      vim.keymap.set({ 'n', }, step_out_key, '<cmd> DapStepOver <CR>',
        { desc = 'Debugger Step Over', silent = true, noremap = true })
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()

      clear_key_bind('n', continue_key)
      clear_key_bind('n', step_into_key)
      clear_key_bind('n', step_out_key)
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end
}
