return {
	'tanvirtin/vgit.nvim',
	config = function()
		require('vgit').setup()

		vim.o.updatetime = 300
		vim.o.incsearch = false
		vim.wo.signcolumn = 'yes'
	end
}
