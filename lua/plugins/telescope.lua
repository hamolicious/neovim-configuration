return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'xiyaowong/telescope-emoji.nvim' },
    { 'ghassan0/telescope-glyph.nvim' },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.load_extension('emoji')
    telescope.load_extension('glyph')
    telescope.load_extension('macrothis')

    vim.keymap.set(
      { 'v', 'n' },
      '<leader>fw',
      function()
        builtin.spell_suggest()
      end,
      { desc = 'Telescope spellings' }
    )

    vim.keymap.set(
      { 'v', 'n' },
      '<leader>fs',
      function()
        builtin.search_history()
      end,
      { desc = 'Telescope search history' }
    )

    vim.keymap.set(
      { 'v', 'n' },
      '<leader>ft',
      function()
        builtin.treesitter({
          show_line = true,
        })
      end,
      { desc = 'Telescope treesitter' }
    )

    vim.keymap.set(
      { 'v', 'n' },
      '<leader>fb',
      function()
        builtin.buffers({
          sort_mru = true,
          select_current = true,
        })
      end,
      { desc = 'Telescope buffers' }
    )

    telescope.extensions = {
      macrothis = {
        mappings = {
          load = "<CR>",
          save = "<C-s>",
          delete = "<C-d>",
          run = "<C-r>",
          rename = "<C-n>",
          edit = "<C-e>",
          quickfix = "<C-q>",
          register = "<C-x>",
          copy_macro = "<C-c>",
          help = "<C-h>",
        },
        items_display = {
          separator = " ",
          hl_chars = { ["["] = "TelescopeBorder", ["]"] = "TelescopeBorder" },
          items = {
            { width = 50 },
            { remaining = true },
          },
        },
        register_display = {
          separator = " ",
          hl_chars = { ["["] = "TelescopeBorder", ["]"] = "TelescopeBorder" },
          items = {
            { width = 4 },
            { remaining = true },
          },
        },
      }
    }
  end
}
