-- TODO: add python venvs

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {
            'dap-watches',
            'dap-stacks',
            'dap-breakpoints',
            'dap-scopes',
            'dap-console',
            'dap-repl'
          },
          winbar = {
            'dap-watches',
            'dap-stacks',
            'dap-breakpoints',
            'dap-scopes',
            'dap-console',
            'dap-repl'
          },
        },
        ignore_focus = {
          'dap-watches',
          'dap-stacks',
          'dap-breakpoints',
          'dap-scopes',
          'dap-console',
          'dap-repl'
        },
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },

      extensions = {
        'nvim-dap-ui',
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { 'encoding',
          {
            'fileformat',
            colored = true,
            icon_only = true,
          }
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'datetime' },
      },
      inactive_sections = {},
      tabline = {},

      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
          'filename',
          file_status = true,
          newfile_status = true,
          path = 1,
          shorting_target = 0,
          symbols = {
            modified = '- modified',
            readonly = '- readonly',
            unnamed = 'can\'t remember',
            newfile = '- new file',
          }
        } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },

      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 1,
            shorting_target = 0,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dap-*',
      callback = function()
        vim.wo.winbar = nil
      end
    })
  end,
}
