-- Source: https://github.com/anuvyklack/windows.nvim/tree/main

return {
	'anuvyklack/windows.nvim',
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim"
	},
	config = function()
		vim.o.equalalways = false

		require('windows').setup({
			autowidth = {
				enable = true,
				winwidth = 20,
				minwinwidth = 20,
				filetype = {
				}
			},
			ignore = {
				buftype = { 'quickfix' },
				filetype = {},
			}
		})
	end
}
