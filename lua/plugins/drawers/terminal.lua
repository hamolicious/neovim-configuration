local drawer = require('nvim-drawer')

local function extendTable(target, source)
  for key, value in pairs(source) do
    target[key] = value
  end
  return target
end

drawer.create_drawer({
  size = 20,
  position = 'below',

  on_vim_enter = function(event)
    local opts = { noremap = false, silent = true }

    vim.keymap.set('n', '<C-a>', function()
      event.instance.focus_or_toggle()
    end, opts)
    vim.keymap.set('t', '<C-a>', function()
      event.instance.focus_or_toggle()
    end, opts)
  end,

  -- When a new buffer is created, switch it to a terminal.
  on_did_create_buffer = function()
    vim.bo.filetype = 'terminal'
    vim.fn.termopen(os.getenv('SHELL'))
  end,

  -- Remove some UI elements.
  on_did_open_buffer = function()
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.statuscolumn = ''
  end,

  -- Scroll to the end when changing tabs.
  on_did_open = function(event)
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set('n', '<leader>tt', function()
      event.instance.go(1)
    end, extendTable({ desc = 'Next Terminal' }, opts))
    vim.keymap.set('n', '<leader>tT', function()
      event.instance.go(-1)
    end, extendTable({ desc = 'Previous Terminal' }, opts))
    vim.keymap.set('n', '<leader>tz', function()
      event.instance.toggle_zoom()
    end, extendTable({ desc = 'Terminal Toggle Zoom' }, opts))
    vim.keymap.set('n', '<leader>tN', function()
      event.instance.open({ mode = 'new' })
    end, extendTable({ desc = 'New Terminal' }, opts))
  end,
})
