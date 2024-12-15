local on_attach = nil
local capabilities = nil

local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})
