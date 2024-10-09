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
		-- Telescope
    { '<leader>ff', ':Telescope find_files<cr>', description = 'Telescope find files' },
    { '<leader>fr', ':Telescope registers<cr>', description = 'Telescope find registers' },
    { '<leader>fg', ':Telescope live_grep<cr>', description = 'Telescope find with live grep' },
    { '<leader>fb', ':Telescope buffers<cr>', description = 'Telescope find buffers' },
    { '<leader>fh', ':Telescope help_tags<cr>', description = 'Telescope find help tags' },
		{ '<leader>fk', '<cmd>Legendary<cr>', description = 'Telescope find keymaps' },

		-- Floating terminals
		{ '<leader><leader>l', '<cmd>FloatermNew --title=LazyGit --autoclose=2 lazygit<cr>', description = 'Open lazygit'},
		{ '<leader><leader>s', '<cmd>FloatermNew --title=Spotify --autoclose=2 spt<cr>', description = 'Open Spotify' },
		{ '<leader><leader>d', '<cmd>FloatermNew --title=Docker --autoclose=2 lazydocker<cr>', description = 'Open lazydocker' },
		{ '<leader><leader>t', '<cmd>FloatermNew --title=Terminal --autoclose=2<cr>', description = 'Create new terminal' },
		{ '<leader><leader>n', '<cmd>FloatermNew --title=MiniNeovim --autoclose=2 nvim .<cr>', description = 'Create temp neovim instance' },
		{ '<leader>w', '<cmd>write<cr>', description = 'Save' },

		-- Windows
		{ '<leader><leader>f', '<cmd>vsplit | Oil<cr>', description = 'Display Oil' },

		-- Operations
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
