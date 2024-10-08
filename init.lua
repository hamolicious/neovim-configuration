local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'folke/tokyonight.nvim'},
  {'nvim-lualine/lualine.nvim'},
	{'nvim-telescope/telescope.nvim'},
})

-- Set <leader> to <space>
vim.g.mapleader = ' '

require('user.editor-conf') -- Editor Options
require('user.auto-cmd')    -- Auto commands
require('user.keybinds')    -- Keybinds
require('user.theme')       -- Theme
require('user.lualine')     -- Lualine
require('user.telescope')   -- Telescope


