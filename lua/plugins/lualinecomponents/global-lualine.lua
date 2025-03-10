local lualine_config = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch' },
  lualine_c = { 'diff', 'diagnostics' },
  lualine_x = {
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
