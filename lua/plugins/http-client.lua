return {
  {
    'mistweaverco/kulala.nvim',
    ft = { "http" },
    opts = {
      scratchpad_default_contents = {
        "@MY_TOKEN_NAME=my_token_value",
        "",
        "# @name scratchpad",
        "POST https://httpbin.org/post HTTP/1.1",
        "accept: application/json",
        "content-type: application/json",
        "",
        "{",
        '  "foo": "bar"',
        "}",
      },
    },
    config = function()
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<CR>",
        "<cmd>lua require('kulala').run()<cr>",
        { noremap = true, silent = true, desc = "Execute the request" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "{",
        "<cmd>lua require('kulala').jump_prev()<cr>",
        { noremap = true, silent = true, desc = "Jump to the previous request" }
      )
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "}",
        "<cmd>lua require('kulala').jump_next()<cr>",
        { noremap = true, silent = true, desc = "Jump to the next request" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>i",
        "<cmd>lua require('kulala').inspect()<cr>",
        { noremap = true, silent = true, desc = "Inspect the current request" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>t",
        "<cmd>lua require('kulala').toggle_view()<cr>",
        { noremap = true, silent = true, desc = "Toggle between body and headers" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>co",
        "<cmd>lua require('kulala').copy()<cr>",
        { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>ci",
        "<cmd>lua require('kulala').from_curl()<cr>",
        { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>ci",
        "<cmd>lua require('kulala').from_curl()<cr>",
        { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
      )
    end
  },
}
