local null_ls = require('null-ls')

local opts = {
	sources = {
		null_ls.builtins.diagnostics.mypy, -- typing
		null_ls.builtins.diagnostics.ruff, -- fast linting
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.luasnip,
	}
}

return opts
