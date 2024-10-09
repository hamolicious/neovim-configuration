-- Install more with :Mason

require('lint').linters_by_ft = {
	javascript = { 'eslint_d' },
	typescript = { 'eslint_d' },
	python = { 'mypy' },
}


vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
	callback = function()
		require('lint').try_lint()
	end,
})

vim.keymap.set('n', '<leader>l', function()
	require('lint').try_lint()
end)
