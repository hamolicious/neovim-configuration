local tab_component = {
  'tabs',
  mode                 = 0,
  tabs_color           = {
    active = { fg = CustomColors.BG, bg = CustomColors.ACTIVE, gui = 'bold' },
    inactive = { fg = CustomColors.TEXT, bg = CustomColors.BG },
  },
  fmt                  = function(name, context)
    local number = context.tabnr
    return '  ' .. number .. ' '
  end,
  max_length           = function() return vim.o.columns end,
  section_separators   = { left = '▎', right = '▎' },
  component_separators = { left = '▎', right = '▎' },
}

local tabline_config = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { tab_component },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

return tabline_config
