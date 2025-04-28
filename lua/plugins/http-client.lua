-- source https://github.com/rodrigoscc/http.nvim

-- TODO: lualine is fighting http for winbar
-- TODO: create git repo containing the bellow
-- TODO: add to cmp config

return {
  "rodrigoscc/http.nvim",
  config = function()
    require("http-nvim").setup({
      http_dir = vim.fn.expand("~/.http"),
      hooks_file = "hooks.lua",
      environments_file = "environments.json",
      active_envs_file = vim.fn.stdpath("data") .. "/http/envs.json",
      win_config = { split = "below" },
      use_compound_filetypes = true,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http*",
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }

        vim.keymap.set("n", "<cr>", "<cmd>Http run_closest<cr>", opts)
      end,
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
