-- Use `:Oil` or `:e` . or `$ vim .` to launch
-- ENTER to open dir
-- `-` to go up a dir
-- `:w` to save changes

return {
	'stevearc/oil.nvim',
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
		{ "folke/which-key.nvim", },
	},
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			}
		})

		vim.keymap.set(
			{ 'v', 'n' },
			'<leader><leader>f',
			function()
				oil.open_float()
			end,
			{ desc = '' }
		)
	end
}
