-- Source: https://github.com/gh-liu/fold_line.nvim

return {
	'gh-liu/fold_line.nvim',
	event = "VeryLazy",
	config = function()
		vim.g.fold_line_disable = false
	end
}
