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

		vim.keymap.set(
			{ 'v', 'n' },
			'<leader>fs',
			function()
				builtin.search_history()
			end,
			{ desc = 'Telescope search history' }
		)

		vim.keymap.set(
			{ 'v', 'n' },
			'<leader>ft',
			function()
				builtin.treesitter({
					show_line = true,
				})
			end,
			{ desc = 'Telescope treesitter' }
		)

		vim.keymap.set(
			{ 'v', 'n' },
			'<leader>fb',
			function()
				builtin.buffers({
					sort_mru = true,
					select_current = true,
				})
			end,
			{ desc = 'Telescope buffers' }
		)
	end
}
