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
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/nvim-cmp'},
	{'tanvirtin/vgit.nvim'},
	{'voldikss/vim-floaterm'},
	{'mrjones2014/legendary.nvim'},
	{'stevearc/dressing.nvim'},
	{'nvim-treesitter/nvim-treesitter'},
	{'karb94/neoscroll.nvim'},
	{'mcauley-penney/visual-whitespace.nvim'},
	{'numToStr/Comment.nvim'},
	{'stevearc/oil.nvim',
  	---@module 'oil'
  	---@type oil.SetupOpts,
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
})

-- Set <leader> to <space>
vim.g.mapleader = ' '

require('user.editor-conf')      -- Editor Options
require('user.legendary')        -- Keybinds, auto-cmds and arbitrary funcs
require('user.dresser')          -- Makes legendary bareable to look at
require('user.theme')            -- Theme
require('user.lualine')          -- Lualine
require('user.telescope')        -- Telescope
require('user.auto-complete')    -- nvim-cmp
require('user.git')              -- git-tui
require('user.tree-sitter')      -- tree-sitter
require('user.neoscroll')        -- smooth scrolling
require('user.visual-whitespace')-- visually display whitespaces
require('user.comment')          -- visually display whitespaces
require('user.oil')              -- File namagement as buffer

