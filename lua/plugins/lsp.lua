return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'pyright',
				'lua_ls',
				'ts_ls',
				-- not a valid entry?!
				-- 'eslint_d',
				-- 'prettierd',
				-- 'eslint_d',
				-- 'black',
				-- 'isort',
			}
		})

		require('lspconfig').lua_ls.setup({})
		require('lspconfig').pyright.setup({})
		require('lspconfig').ts_ls.setup({})
		require('lspconfig').csharp_ls.setup({})
	end

}
