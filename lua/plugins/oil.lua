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
		require("oil").setup()
	end
}
