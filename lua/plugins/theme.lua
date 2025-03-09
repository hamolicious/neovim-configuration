return {
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd.colorscheme('tokyonight-night')

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = CustomColors.SPLIT })

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
