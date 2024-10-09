return {
	'mawkler/modicator.nvim',
	event = 'ModeChanged',
	init = function()
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
	integration = {
		lualine = {
			enabled = true,
			-- Letter of lualine section to use (if `nil`, gets detected automatically)
			mode_section = 'a',
			-- Whether to use lualine's mode highlight's foreground or background
			highlight = 'bg',
		}
	}
}
