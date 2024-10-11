return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'xiyaowong/telescope-emoji.nvim' },
		{ 'ghassan0/telescope-glyph.nvim' },
	},
	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')

		telescope.load_extension('emoji')
		telescope.load_extension('glyph')
	end
}
