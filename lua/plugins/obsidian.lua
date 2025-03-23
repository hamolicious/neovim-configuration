-- source https://github.com/epwalsh/obsidian.nvim
return {
  'epwalsh/obsidian.nvim',
  ft           = 'markdown',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts         = {
    notes_subdir       = "Inbox",
    new_notes_location = "Inbox",

    sort_by            = "modified",
    sort_reversed      = true,

    open_notes_in      = 'vsplit',

    workspaces         = {
      {
        name = 'personal',
        path = '~/.notes/Notes',
      }
    },

    daily_notes        = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily Notes",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = nil,
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },

    mappings           = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },

      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
  },
}
