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
            'dap-repl',
          },
          winbar = {
            'dap-watches',
            'dap-stacks',
            'dap-breakpoints',
            'dap-scopes',
            'dap-console',
            'dap-repl',
            'terminal',
          },
        },
        ignore_focus = {
          'dap-watches',
          'dap-stacks',
          'dap-breakpoints',
          'dap-scopes',
          'dap-console',
          'dap-repl',
        },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 50,
          winbar = 50,
        }
      },

      extensions = {
        'nvim-dap-ui',
      },

      inactive_sections = {},

      sections = require('plugins.lualinecomponents.global-lualine'),
      tabline = require('plugins.lualinecomponents.tabline'),
      winbar = require('plugins.lualinecomponents.winbar'),
      inactive_winbar = require('plugins.lualinecomponents.inactive-winbar'),
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dap-*',
      callback = function()
        vim.wo.winbar = nil
      end
    })
  end,
}
