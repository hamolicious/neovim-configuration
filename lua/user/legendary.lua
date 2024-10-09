require('legendary').setup({
	extensions = {
		lazy_nvim = { auto_register = true },
		which_key = {
			auto_register = true,
			do_binding = false,
			use_groups = true,
		},
	},
	
	keymaps = {
		{ '<leader><leader>l', '<cmd>FloatermNew --title=LazyGit --autoclose=2 lazygit<cr>', description = 'Open lazygit'},
		{ '<leader><leader>s', '<cmd>FloatermNew --title=Spotify --autoclose=2 spt<cr>', description = 'Open Spotify' },
		{ '<leader><leader>d', '<cmd>FloatermNew --title=Docker --autoclose=2 lazydocker<cr>', description = 'Open lazydocker' },
		{ '<leader><leader>t', '<cmd>FloatermNew --title=Terminal --autoclose=2<cr>', description = 'Create new terminal' },
		{ '<leader><leader>k', '<cmd>Legendary<cr>', description = 'Show keymap legend panel' },
		{ '<leader>w', '<cmd>write<cr>', description = 'Save' },
		{ 'gy', '"+y', description = 'Copy to clipboard' },
		{ 'gp', '"+p', description = 'Paste from clipboard' },
		{ 'x', '"_x', description = 'Delete a char without affecting registers' },
		{ 'X', '"_d', description = 'Acts like d without affecting registers' },
	},

	autocmds = {
		{ 'FileType', 'nnoremap <buffer> q <cmd>quit<cr>', opts = {pattern = {'help', 'man'}} , description = 'Use q to close the window' },
		{ 'TextYankPost',
			function(event)
				vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
			end,
		description = 'Highlight on yank' },
	}
 })
