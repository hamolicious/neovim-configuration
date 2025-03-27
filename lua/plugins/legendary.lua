return {
  'mrjones2014/legendary.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
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
        -- Debugging
        { '<leader>db', '<cmd> DapToggleBreakpoint <CR>', description = 'Debugger Toggle Breakpoint' },
        { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, description = 'Debugger Toggle Conditional Breakpoint' },
        { '<leader>dr', '<cmd> DapContinue <CR>', description = 'Debugger Run' },
        { '<leader>dt', '<cmd> DapTerminate <CR>', description = 'Debugger Terminate Session' },
        { '<leader>dx', '<cmd> DapClearBreakpoints <CR>', description = 'Debugger Clear Breakpoints' },
        { '<leader>du', function() require('dapui').toggle() end, description = 'Debugger Toggle UI' },

        -- Telescope
        { '<leader>fr', ':Telescope resume<cr>', description = 'Telescope resume last one innit bruv' },
        { '<leader>ff', ':Telescope find_files<cr>', description = 'Telescope find files' },
        { '<leader>fR', ':Telescope registers<cr>', description = 'Telescope find registers' },
        { '<leader>fg', ':Telescope live_grep<cr>', description = 'Telescope find with live grep' },
        { '<leader>fh', ':Telescope help_tags<cr>', description = 'Telescope find help tags' },
        { '<leader>fd', ':Telescope diagnostics<cr>', description = 'Telescope find diagnostics' },
        { '<leader>fe', ':Telescope emoji<cr>', description = 'Telescope find emojies' },
        { '<leader>fc', ':Telescope glyph<cr>', description = 'Telescope find glyphs' },
        { '<leader>fk', '<cmd>Legendary<cr>', description = 'Telescope find keymaps' },
        { '<leader>fn', function() require('telescope.builtin').find_files({ cwd = '~/.notes/Notes' }) end, description = 'Telescope find notes' },

        { '<leader>fP', ':Telescope planets<cr>', description = 'Telescope planets 🤷' },

        -- Notes
        { '<leader>oo', ':ObsidianOpen<cr>', description = 'Open Obsidian' },
        { '<leader>ot', ':ObsidianToday<cr>', description = 'Open Daily Note' },
        { '<leader>oy', ':ObsidianYesterday<cr>', description = 'Obsidian Yesterdays Daily Note' },
        { '<leader>on', ':ObsidianNew<cr>', description = 'Open New Note' },
        { '<leader>oi', ':ObsidianTemplate<cr>', description = 'Obsidian Insert Template' },
        { '<leader>oq', ':ObsidianQuickSwitch<cr>', description = 'Obsidian Quick Switch' },
        { '<leader>oT', ':ObsidianTags<cr>', description = 'Obsidian Tags' },
        { '<leader>ol', ':ObsidianLink<cr>', description = 'Obsidian Link', mode = { 'v' } },
        { '<leader>ob', ':ObsidianBacklinks<cr>', description = 'Obsidian Backlinks' },
        { '<leader>oa', ':ObsidianPasteImg<cr>', description = 'Obsidian Attach Image' },
        { '<leader>od', ':ObsidianDailies<cr>', description = 'Obsidian Daily Notes' },
        { '<leader>og', ':ObsidianSearch<cr>', description = 'Obsidian GREP Search' },

        -- Floating terminals
        -- src: https://github.com/jesseduffield/lazygit
        { '<leader><leader>l', '<cmd>FloatermNew --title=LazyGit --autoclose=2 lazygit<cr>', description = 'Open lazygit' },

        -- src: https://github.com/jesseduffield/lazydocker
        { '<leader><leader>d', '<cmd>FloatermNew --title=Docker --autoclose=2 lazydocker<cr>', description = 'Open lazydocker' },

        { '<leader><leader>n', '<cmd>FloatermNew --title=MiniNeovim --autoclose=2 nvim .<cr>', description = 'Create temp neovim instance' },

        -- AI
        { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', description = 'Toggle AI chat session', mode = { 'n', 'v' } },
        { '<leader>ar', '<cmd>CodeCompanionActions<cr>', description = 'Activate AI code actions', mode = { 'n', 'v' } },

        -- src:
        { '<leader>tn', '<cmd>UploadNote<cr>', description = 'Take Trilum Note', mode = { 'n', 'v' } },

        -- Operations
        { '<leader>w', '<cmd>write<cr>', description = 'Save' },
        { 'gy', '"+y', description = 'Copy to clipboard', mode = { 'n', 'v' } },
        { 'gp', '"+p', description = 'Paste from clipboard' },
        { 'x', '"_x', description = 'Delete a char without affecting registers' },
        { 'X', '"_d', description = 'Acts like d without affecting registers' },

        -- Editor settings
        { '<leader>tr', '<cmd>set relativenumber<cr>', description = 'Use relative line numbers', mode = { 'n', 'v' } },
        { '<leader>tl', '<cmd>set norelativenumber<cr>', description = 'Use non-relative line numbers', mode = { 'n', 'v' } },

        -- Tabs and Terms
        { 'tn', '<cmd>tabnew<cr>', description = 'New Tab', mode = { 'n', 'v' } },
        { 'tw', '<cmd>tabclose<cr>', description = 'Close Tab', mode = { 'n', 'v' } },

        -- Games
        { '<leader>pm', '<cmd>Nvimesweeper<cr>', description = 'Play Minesweeper', mode = { 'n', 'v' } },

        -- Git
        { 'gbl', '<cmd> Gitsigns blame_line <cr>', description = 'Git Blame Line', mode = { 'n' } },
        { 'gbb', '<cmd> Gitsigns blame <cr>', description = 'Git Blame', mode = { 'n' } },
        { 'hn', '<cmd> Gitsigns next_hunk <cr>', description = 'Git Goto Next Hunk', mode = { 'n' } },
        { 'hp', '<cmd> Gitsigns prev_hunk <cr>', description = 'Git Goto Previous Hunk', mode = { 'n' } },
        { '<leader>gg', '<cmd>GitignoreGenerate<cr>', description = 'Generate .gitignore', mode = { 'n' } },

        -- Http
        { '<leader>rr', '<cmd>Http run<cr>', description = 'HTTP Run', mode = { 'n' } },
        { '<leader>re', '<cmd>Http jump<cr>', description = 'HTTP Edit Request', mode = { 'n' } },
        { '<leader>rl', '<cmd>Http run_last<cr>', description = 'HTTP Run Last Request', mode = { 'n' } },
        { '<leader>rs', '<cmd>Http select_env<cr>', description = 'HTTP Select Environment', mode = { 'n' } },
        { '<leader>ri', '<cmd>Http inspect<cr>', description = 'HTTP Inspect', mode = { 'n' } },
        { '<leader>ror', '<cmd>Http jump<cr>', description = 'HTTP Open Request', mode = { 'n' } },
        { '<leader>roe', '<cmd>Http open_env<cr>', description = 'HTTP Open Environment', mode = { 'n' } },
        { '<leader>roh', '<cmd>Http open_hooks<cr>', description = 'HTTP Open Hooks', mode = { 'n' } },

        -- Gitlink
        { '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', description = 'Copy Gitlink <current line>', mode = { 'n' } },
        { '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', description = 'Copy Gitlink <current line, open in browser>', mode = { 'n' } },
        { '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', description = 'Copy Gitlink <current selection>', mode = { 'v' } },
        { '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', description = 'Copy Gitlink <current selection, open in browser>', mode = { 'v' } },

        -- Code
        { '<leader>rn', vim.lsp.buf.rename, description = 'Rename symbol' },
        { '<leader>ca', vim.lsp.buf.code_action, description = 'Code action' },
        { 'gr', require('telescope.builtin').lsp_references, description = 'Peek references' },
        { 'gd', vim.lsp.buf.definition, description = 'Goto definition' },
        { 'gi', vim.lsp.buf.implementation, description = 'Goto implementation' },
        { 'K', vim.lsp.buf.hover, description = 'Show hover' },
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
          mode = { 'n', 'v' }
        },

        -- Registers
        { 'Q', '@q', description = 'Play the q register' },
      },

      autocmds = {
        {
          'FileType',
          'nnoremap <buffer> q <cmd>quit<cr>',
          opts = { pattern = { 'help', 'man' } },
          description = 'Use q to close the window',
        },
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
