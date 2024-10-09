-- Install more with :Mason

require('conform').setup({
	formatters_by_ft = {
		python = { 'isort', 'black' },
		javascript = { 'prettierd' },
		typescript = { 'prettierd' },
		css = { 'prettierd' },
		html = { 'prettierd' },
		json = { 'prettierd' },
		yaml = { 'prettierd' },
		markdown = { 'prettierd' },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}
})
