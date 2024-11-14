return {
	'mrjones2014/legendary.nvim',
	config = function()
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
				{ '<leader>ff',        ':Telescope find_files<cr>',                                                                                              description = 'Telescope find files' },
				{ '<leader>fr',        ':Telescope registers<cr>',                                                                                               description = 'Telescope find registers' },
				{ '<leader>fg',        ':Telescope live_grep<cr>',                                                                                               description = 'Telescope find with live grep' },
				{ '<leader>fh',        ':Telescope help_tags<cr>',                                                                                               description = 'Telescope find help tags' },
				{ '<leader>fd',        ':Telescope diagnostics<cr>',                                                                                             description = 'Telescope find diagnostics' },
				{ '<leader>fe',        ':Telescope emoji<cr>',                                                                                                   description = 'Telescope find emojies' },
				{ '<leader>fc',        ':Telescope glyph<cr>',                                                                                                   description = 'Telescope find glyphs' },
				{ '<leader>fk',        '<cmd>Legendary<cr>',                                                                                                     description = 'Telescope find keymaps' },

				-- Floating terminals
				-- src: https://github.com/jesseduffield/lazygit
				{ '<leader><leader>l', '<cmd>FloatermNew --title=LazyGit --autoclose=2 lazygit<cr>',                                                             description = 'Open lazygit' },

				-- src: https://github.com/Rigellute/spotify-tui
				{ '<leader><leader>s', '<cmd>FloatermNew --title=Spotify --autoclose=2 spt<cr>',                                                                 description = 'Open Spotify' },

				-- src: https://github.com/jesseduffield/lazydocker
				{ '<leader><leader>d', '<cmd>FloatermNew --title=Docker --autoclose=2 lazydocker<cr>',                                                           description = 'Open lazydocker' },

				{ '<leader><leader>t', '<cmd>FloatermNew --title=Terminal --autoclose=2<cr>',                                                                    description = 'Create new terminal' },
				{ '<leader><leader>n', '<cmd>FloatermNew --title=MiniNeovim --autoclose=2 nvim .<cr>',                                                           description = 'Create temp neovim instance' },
				{ '<leader>w',         '<cmd>write<cr>',                                                                                                         description = 'Save' },

				-- Operations
				{ 'gy',                '"+y',                                                                                                                    description = 'Copy to clipboard',                                 mode = { 'n', 'v' } },
				{ 'gp',                '"+p',                                                                                                                    description = 'Paste from clipboard' },
				{ 'x',                 '"_x',                                                                                                                    description = 'Delete a char without affecting registers' },
				{ 'X',                 '"_d',                                                                                                                    description = 'Acts like d without affecting registers' },

				-- Gitlink
				{ '<leader>gy',        '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',                                                                 description = 'Copy Gitlink <current line>',                       mode = { 'n' } },
				{ '<leader>gb',        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', description = 'Copy Gitlink <current line, open in browser>',      mode = { 'n' } },
				{ '<leader>gy',        '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>',                                                                 description = 'Copy Gitlink <current selection>',                  mode = { 'v' } },
				{ '<leader>gb',        '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', description = 'Copy Gitlink <current selection, open in browser>', mode = { 'v' } },

				-- Code
				{ '<leader>rn',        vim.lsp.buf.rename,                                                                                                       description = 'Rename symbol' },
				{ '<leader>ca',        vim.lsp.buf.code_action,                                                                                                  description = 'Code action' },
				{ 'gr',                require('telescope.builtin').lsp_references,                                                                              description = 'Peek references' },
				{ 'gd',                vim.lsp.buf.definition,                                                                                                   description = 'Goto definition' },
				{ 'gi',                vim.lsp.buf.implementation,                                                                                               description = 'Goto implementation' },
				{ 'K',                 vim.lsp.buf.hover,                                                                                                        description = 'Show hover' },
				{
					'<leader>bf',
					function()
						require('conform').format({
							lsp_fallback = true,
							async = false,
							timeout_ms = 500,
						})
					end,
					description = 'Format file',
					mode = {'n', 'v'}
				},


				-- Registers
				{ 'Q', '@q', description = 'Play the q register' },
			},

			autocmds = {
				{ 'FileType', 'nnoremap <buffer> q <cmd>quit<cr>', opts = { pattern = { 'help', 'man' } }, description = 'Use q to close the window' },
				{
					'TextYankPost',
					function(_)
						vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
					end,
					description = 'Highlight on yank'
				},
			}
		})
	end
}
