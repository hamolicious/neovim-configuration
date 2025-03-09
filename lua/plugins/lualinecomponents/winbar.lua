function CenteredFilenameComponent()
  local width = vim.api.nvim_win_get_width(0)
  local filename = vim.fn.fnamemodify(vim.fn.bufname('%'), ':t')
  if filename == '' then
    filename = '[No Name]'
  end

  local state = ' '
  if vim.bo.modified then
    state = ' ● '
  elseif vim.bo.readonly then
    state = '  '
  end

  local content = string.format('《 %s%s 》', filename, state)

  if #content >= width then
    return content
  end

  local padding = math.floor((width - #content) / 2)
  return string.rep(' ', padding) .. content
end

local filename_component = {
  'filename',
  path  = 1,
  fmt   = CenteredFilenameComponent,
  color = { fg = CustomColors.ACTIVE, bg = CustomColors.BG, gui = 'bold' },
}

local winbar_config = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { filename_component },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

return winbar_config
