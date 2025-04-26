local tab_component = {
  'tabs',
  mode       = 1,
  tabs_color = {
    active = { fg = CustomColors.BG, bg = CustomColors.ACTIVE, gui = 'bold' },
    inactive = { fg = CustomColors.TEXT, bg = CustomColors.BG },
  },
  fmt        = function(name, context)
    local number = context.tabnr
    return '  ' .. number .. ' - ' .. name .. ' '
  end,
  max_length = function() return vim.o.columns end,
}

local lualine_config = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch', 'diff', 'diagnostics' },
  lualine_c = { tab_component },
  lualine_x = {
    require("plugins.codecompanion.lualine"),
    require("http-nvim").http_env_lualine_component,
    'encoding',
    {
      'fileformat',
      colored = true,
      icon_only = true,
    }
  },
  lualine_y = { 'filetype' },
  lualine_z = { 'datetime' },
}

return lualine_config
