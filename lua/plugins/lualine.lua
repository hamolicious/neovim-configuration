-- TODO: add python venvs

local function centered_filename()
  local width = vim.api.nvim_win_get_width(0)
  local filename = vim.fn.fnamemodify(vim.fn.bufname('%'), ':t')
  local content = string.format('《 %s 》', filename)

  if #content >= width then
    return content
  end

  local padding = math.floor((width - #content) / 2)
  return string.rep(' ', padding) .. content
end

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
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 250,
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
        lualine_c = {
          {
            'filename',
            path = 1,
            fmt = centered_filename,
          },
        },
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
            path = 1,
            fmt = centered_filename,
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
