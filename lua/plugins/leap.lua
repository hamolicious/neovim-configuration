return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require('leap')

    vim.keymap.set({ 'n', }, 's', function()
      leap.leap({})
    end, { noremap = false, silent = true })

    vim.keymap.set({ 'n', }, 'S', function()
      leap.leap({ backward = true })
    end, { noremap = false, silent = true })

    vim.keymap.set({ 'n', }, 'gs', function()
      leap.leap({
        target_windows = require('leap.util').get_enterable_windows()
      })
    end, { noremap = false, silent = true })
  end
}
