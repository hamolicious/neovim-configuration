-- Keybinds
-- C-u  |  up
-- C-d  |  down
-- C-f  |  page-down
-- C-b  |  page-up
-- zz   |  center cursor
-- zt   |  place cursor top
-- zb   |  place cursor bottom

return {
	'karb94/neoscroll.nvim',
	config = function()
		require('neoscroll').setup({
			hide_cursor = true,      -- Hide cursor while scrolling
			stop_eof = true,         -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing = 'sine',         -- Default easing function
			pre_hook = nil,          -- Function to run before the scrolling animation starts
			post_hook = nil,         -- Function to run after the scrolling animation ends
			performance_mode = true, -- Disable "Performance Mode" on all buffers.
			ignored_events = {       -- Events ignored while scrolling
				'WinScrolled', 'CursorMoved'
			},
		})
	end
}
