local inactive_winbar_config = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      'filename',
      path = 1,
      fmt = CenteredFilenameComponent,
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
}

return inactive_winbar_config
