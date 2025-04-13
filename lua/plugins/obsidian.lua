-- source https://github.com/epwalsh/obsidian.nvim
return {
  'epwalsh/obsidian.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts         = {
    notes_subdir          = "Inbox",
    new_notes_location    = "Inbox",

    sort_by               = "accessed",
    sort_reversed         = true,

    open_notes_in         = 'vsplit',

    workspaces            = {
      {
        name = 'personal',
        path = '~/.notes/Notes',
      }
    },

    daily_notes           = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily Notes",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = nil,
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = 'Templates/Daily Note Template.md'
    },

    templates             = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    note_id_func          = function(title)
      return title
    end,

    note_frontmatter_func = function(note)
      return note
    end,

    -- Don't manage frontmatter
    disable_frontmatter   = true,

    mappings              = {
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

      -- Renaming files
      ["<leader>rn"] = {
        action = ":ObsidianRename<cr>",
        opts = { buffer = true },
      },

      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    ui                    = {
      enable             = true, -- set to false to disable all additional syntax features
      update_debounce    = 200,  -- update delay after a text change (in milliseconds)
      max_file_length    = 5000, -- disable UI features for files with more than this many lines
      -- Define how various check-boxes are displayed
      checkboxes         = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },

      -- Use bullet marks for non-checkbox lists.
      bullets            = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

      reference_text     = { hl_group = "ObsidianRefText" },
      highlight_text     = { hl_group = "ObsidianHighlightText" },

      tags               = { hl_group = "ObsidianTag" },
      block_ids          = { hl_group = "ObsidianBlockID" },
      hl_groups          = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

  },
}
