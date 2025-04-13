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
      },

      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["L"] = "actions.refresh",
        ["<C-l>"] = {},
        ["<C-h>"] = {},
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
    })

    vim.keymap.set(
      { 'v', 'n' }, '-', '<cmd>Oil<cr>', { desc = '' }
    )
  end
}
