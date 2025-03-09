return {
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd.colorscheme('tokyonight-night')

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = CustomColors.SPLIT })

    vim.cmd([[
      augroup MyTODO
        autocmd!
        autocmd Syntax * call matchadd('myTodo', '\v<(HACK|FIX|QUESTION|TODO|NOTE)>\:')
      augroup END
      highlight myTodo ctermbg=yellow ctermfg=black guibg=yellow guifg=black
    ]])

    vim.api.nvim_set_hl(0, "TODO", { fg = 'Yellow' })

    vim.opt.fillchars:append({
      horiz = '━',
      horizup = '┻',
      horizdown = '┳',
      vert = '┃',
      vertleft = '┫',
      vertright = '┣',
      verthoriz = '╋',
    })
  end
}
