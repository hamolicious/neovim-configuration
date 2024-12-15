return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{
			'williamboman/mason.nvim',
			opts = {
				ensure_installed = {
					'mypy',
					'ruff',
					'debugpy',
					'pyright',
					'black',
					'isort',
					'eslint_d',
					'prettierd',
				}
			}
		},
		{ 'williamboman/mason-lspconfig.nvim' },
		{
			"jose-elias-alvarez/null-ls.nvim",
			opts = function()
				return require('plugins.null-ls')
			end
		},
	},
	config = function()
		require('mason').setup()

		require('mason-lspconfig').setup({
			ensure_installed = {
				'pyright',
				'lua_ls',
				'ts_ls',
			}
		})

		require('lspconfig').lua_ls.setup({})
		require('lspconfig').pyright.setup({})
		require('lspconfig').ts_ls.setup({})
		require('lspconfig').csharp_ls.setup({})
		require('lspconfig').docker_compose_language_service.setup({})
		require('lspconfig').dockerls.setup({})
		require('lspconfig').gitlab_ci_ls.setup({})

		-- require('plugins.configs.lspconfig')
	end
}
