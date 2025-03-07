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
    local continue_key = 'gr'
    local step_into_key = 'gi'
    local step_out_key = 'go'

    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      floating = {
        max_height = 0.8,
        max_width = 0.8,
      },
    })

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

