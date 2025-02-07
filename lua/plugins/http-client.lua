return {
  {
    'mistweaverco/kulala.nvim',
    ft = { "http" },
    opts = {
      -- TODO: this doesn't seem to work
      scratchpad_default_contents = {
        "# Static definitions",
        "@USER_AGENT=quoting-engineer",
        "@LOCAL_HOST=http://localhost:8080",
        "@SHADOW_HOST=https://-shadow.vassily.io",
        "",
        "# Variables",
        "@URI={{SHADOW_HOST}}",
        "",
        "###",
        "# @name auth",
        "POST https://identity-signin-core.shadow.ctmers.io/connect/token HTTP/1.1",
        "User-Agent: {{USER_AGENT}}",
        "Content-Type: application/x-www-form-urlencoded",
        "Accept: application/json",
        "",
        "client_id={{ENV_VAR_CLIENT_ID}}&",
        "client_secret={{ENV_VAR_CLIENT_SECRET}}&",
        "grant_type=client_credentials&",
        "scope=<scope>",
        "",
        "",
        "###",
        "# @name results",
        "GET {{URI}}/liveness HTTP/1.1",
        "User-Agent: {{USER_AGENT}}",
        "Accept: application/json",
        "Authorization: Bearer {{auth.response.body.access_token}}",
        "ctm-user-agent: {{USER_AGENT}}",
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
        "ri",
        "<cmd>lua require('kulala').inspect()<cr>",
        { noremap = true, silent = true, desc = "Inspect the current request" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "rt",
        "<cmd>lua require('kulala').toggle_view()<cr>",
        { noremap = true, silent = true, desc = "Toggle between body and headers" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>fr",
        "<cmd>lua require('kulala').search()<cr>",
        { noremap = true, silent = true, desc = "Find requests" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>sp",
        "<cmd>lua require('kulala').scratchpad()<cr>",
        { noremap = true, silent = true, desc = "Open request scratchpad" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>ry",
        "<cmd>lua require('kulala').copy()<cr>",
        { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
      )

      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<leader>rp",
        "<cmd>lua require('kulala').from_curl()<cr>",
        { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
      )
    end
  },
}
