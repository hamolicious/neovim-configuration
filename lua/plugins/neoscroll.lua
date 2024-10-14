-- Keybinds
-- C-e  |  scroll down a bit
-- C-y  |  scroll up a bit
-- C-u  |  up
-- C-d  |  down
-- zz   |  center cursor
-- zt   |  place cursor top
-- zb   |  place cursor bottom

return {
	'karb94/neoscroll.nvim',
	config = function()
		neoscroll = require('neoscroll')

		neoscroll.setup({
			hide_cursor = true,       -- Hide cursor while scrolling
			stop_eof = true,          -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing = 'sine',          -- Default easing function
			pre_hook = nil,           -- Function to run before the scrolling animation starts
			post_hook = nil,          -- Function to run after the scrolling animation ends
			performance_mode = false, -- Disable "Performance Mode" on all buffers.
			ignored_events = {        -- Events ignored while scrolling
				'WinScrolled', 'CursorMoved'
			},
			mappings = {}
		})

		local keymap = {
			["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
			["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
			["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
			["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
			["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
			["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
			["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
		}

		vim.keymap.set({ 'n', 'v', 'i' }, '<C-u>', function() neoscroll.ctrl_u({ duration = 250 }) end,
			{ desc = 'Scroll up' })

		vim.keymap.set({ 'n', 'v', 'i' }, '<C-d>', function() neoscroll.ctrl_d({ duration = 250 }) end,
			{ desc = 'Scroll down' })

		vim.keymap.set({ 'n', 'v', 'i' }, '<C-y>',
			function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
			{ desc = 'Move half-page up' })

		vim.keymap.set({ 'n', 'v', 'i' }, '<C-e>',
			function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
			{ desc = 'Move half-page down' })
	end
}
