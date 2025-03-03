return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require("lazy").setup({ {
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html", "c_sharp" },
					ignore_install = { "help", "man" },  -- Add the file types you want to ignore
					sync_install = false,
					highlight = {
						enable = true,
						disable = { "help", "man" },  -- Disable Treesitter highlighting for help and man pages
					},
					indent = { enable = true },
				})
			end
		} })
	end
}
