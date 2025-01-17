return {
	'L3MON4D3/LuaSnip',
	dependencies = {
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	after = 'nvim-cmp',
	config = function()
		local ls = require('luasnip')

		require('snippets.global')
		require('snippets.python')
		require('snippets.markdown')
		require('snippets.typescript')

		-- vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true, desc = "Jump to next insertion" })
		vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end,
			{ silent = true, desc = "Jump to previous insertion" })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true, desc = "Cycle throught insertions" })
	end,
}
