return {
	'mawkler/modicator.nvim',
	event = 'ModeChanged',
	integration = {
		lualine = {
			enabled = true,
			highlight = 'bg',
		}
	},
	config = function()
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true

		require('modicator').setup()
	end,
}
