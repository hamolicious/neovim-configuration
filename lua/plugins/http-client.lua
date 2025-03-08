-- TODO: lualine is fighting http for winbar

return {
  "rodrigoscc/http.nvim",
  config = function()
    require("http-nvim").setup({
      http_dir = "~/.http",
      hooks_file = "hooks.lua",
      environments_file = "environments.json",
      active_envs_file = vim.fn.stdpath("data") .. "/http/envs.json",
      win_config = { split = "below" },
    })
  end,
  build = { ":TSUpdate http2", ":Http update_grammar_queries" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
}
