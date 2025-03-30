-- source https://github.com/stevearc/oil.nvim

-- Use `:Oil` or `:e` . or `$ vim .` to launch
-- ENTER to open dir
-- `-` to go up a dir
-- `:w` to save changes

return {
  'stevearc/oil.nvim',
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
    { "folke/which-key.nvim", },
  },
  config = function()
    local oil = require("oil")
    oil.setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      }
    })

    vim.keymap.set(
      { 'v', 'n' }, '-', '<cmd>Oil<cr>', { desc = '' }
    )
  end
}
