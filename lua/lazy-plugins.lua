-- ██╗      █████╗ ███████╗██╗   ██╗         Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝    z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝   z
-- ███████╗██║  ██║███████╗   ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝

local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"
-- install lazy
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy just installed, please restart neovim")
	return
end

-- install plugins
lazy.setup({
	spec = {
		require('plugins.legendary'),        -- Keybinds, auto-cmds and arbitrary funcs
		require('plugins.floaterm'),         -- Floating terminals
		require('plugins.lsp'),              -- Intelisense
		require('plugins.formatting'),       -- Formatting
		require('plugins.linting'),          -- Formatting
		require('plugins.dresser'),          -- Makes legendary bareable to look at
		require('plugins.theme'),            -- Theme
		require('plugins.lualine'),          -- Lualine
		require('plugins.telescope'),        -- Telescope
		require('plugins.auto-complete'),    -- nvim-cmp
		require('plugins.git'),              -- git-tui
		require('plugins.tree-sitter'),      -- tree-sitter
		require('plugins.highlight'),        -- highligh occurances
		require('plugins.neoscroll'),        -- smooth scrolling
		require('plugins.visual-whitespace'), -- visually display whitespaces
		require('plugins.comment'),          -- visually display whitespaces
		require('plugins.oil'),              -- File namagement as buffer
		require('plugins.fold-line'),        -- Show folds
		require('plugins.auto-scale-windows'), -- Scale windows automatically
	},
	---@diagnostic disable-next-line
	dev = {
		path = "~/.local/src",
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
	ui = {
		size = { width = 0.8, height = 0.8 }, -- hmmm?
		wrap = true,
		border = "shadow",
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
	},
})
