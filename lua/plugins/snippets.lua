return {
	'L3MON4D3/LuaSnip',
	dependencies = {
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	after = 'nvim-cmp',
	config = function() require('snippets.global') end,
}
