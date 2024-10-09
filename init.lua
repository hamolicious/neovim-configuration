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
	{ 'folke/tokyonight.nvim' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{
		'stevearc/conform.nvim',
		-- event = { "BufReadPre", "BufNewFile", },
	},
	{ 'mfussenegger/nvim-lint',
		-- event = { "BufReadPre", "BufNewFile", },
	},
	{ 'nvim-telescope/telescope.nvim' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'tanvirtin/vgit.nvim' },
	{ 'voldikss/vim-floaterm' },
	{ 'mrjones2014/legendary.nvim' },
	{ 'stevearc/dressing.nvim' },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'karb94/neoscroll.nvim' },
	{ 'mcauley-penney/visual-whitespace.nvim' },
	{ 'numToStr/Comment.nvim' },
	{
		'stevearc/oil.nvim',
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
			{ "folke/which-key.nvim" },
		},
	},
	{ 'gh-liu/fold_line.nvim', event = 'VeryLazy' },
	{ 'RRethy/vim-illuminate' },
})

-- Set <leader> to <space>
vim.g.mapleader = ' '

require('user.editor-conf')       -- Editor Options
require('user.legendary')         -- Keybinds, auto-cmds and arbitrary funcs
require('user.lsp')               -- Intelisense
require('user.formatting')        -- Formatting
require('user.linting')           -- Formatting
require('user.dresser')           -- Makes legendary bareable to look at
require('user.theme')             -- Theme
require('user.lualine')           -- Lualine
require('user.telescope')         -- Telescope
require('user.auto-complete')     -- nvim-cmp
require('user.git')               -- git-tui
require('user.tree-sitter')       -- tree-sitter
require('user.neoscroll')         -- smooth scrolling
require('user.visual-whitespace') -- visually display whitespaces
require('user.comment')           -- visually display whitespaces
require('user.oil')               -- File namagement as buffer
require('user.fold-line')         -- Folding lines
