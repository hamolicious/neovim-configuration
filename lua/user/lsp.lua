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
