-- source https://github.com/Isrothy/neominimap.nvim

return {
  'Isrothy/neominimap.nvim',
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  lazy = false,
  keys = {
    -- Global Minimap Controls
    { "<leader>nm",  "<cmd>Neominimap toggle<cr>",      desc = "Toggle global minimap" },
    { "<leader>no",  "<cmd>Neominimap on<cr>",          desc = "Enable global minimap" },
    { "<leader>nc",  "<cmd>Neominimap off<cr>",         desc = "Disable global minimap" },
    { "<leader>nr",  "<cmd>Neominimap refresh<cr>",     desc = "Refresh global minimap" },

    -- Buffer-Specific Minimap Controls
    { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>",   desc = "Toggle minimap for current buffer" },
    { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>",  desc = "Refresh minimap for current buffer" },
    { "<leader>nbo", "<cmd>Neominimap bufOn<cr>",       desc = "Enable minimap for current buffer" },
    { "<leader>nbc", "<cmd>Neominimap bufOff<cr>",      desc = "Disable minimap for current buffer" },

    ---Focus Controls
    { "<leader>nf",  "<cmd>Neominimap focus<cr>",       desc = "Focus on minimap" },
    { "<leader>nu",  "<cmd>Neominimap unfocus<cr>",     desc = "Unfocus minimap" },
    { "<leader>nt",  "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
  },
  init = function()
    local min_num_lines = 30
    local minimap_width = 20
    local min_minimap_width = minimap_width * 3

    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36

    vim.g.neominimap = {
      auto_enable = true,

      buf_filter = function(bufnr)
        if (vim.api.nvim_buf_line_count(bufnr) < min_num_lines) then
          return false
        end

        return true
      end,

      win_filter = function(winid)
        if (vim.api.nvim_win_get_width(winid) < min_minimap_width) then
          return false
        end

        return true
      end,

      exclude_filetypes = {
        "help",
        "bigfile",
        "oil",
      },

      exclude_buftypes = {
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
        "prompt",
      },

      layout = "float",
      float = {
        minimap_width = minimap_width,
        max_minimap_height = nil,

        margin = {
          right = 0,
          top = 0,
          bottom = 0,
        },
        z_index = 1,

        window_border = "single",
      },

      git = {
        enabled = true,
        mode = "sign",
        priority = 6,
        icon = {
          add = "+ ",
          change = "~ ",
          delete = "- ",
        },
      },

      search = {
        enabled = true,
        mode = "line",
        priority = 20,
        icon = "󰱽 ",
      },

      treesitter = {
        enabled = true,
        priority = 200,
      },

      mark = {
        enabled = true,
        mode = "icon",
        priority = 10,
        key = "m",
        show_builtins = false,
      },

      fold = {
        enabled = true,
      },
    }
  end,
}
