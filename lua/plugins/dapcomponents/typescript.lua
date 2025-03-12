local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "node2",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      outFiles = { "${workspaceFolder}/dist/**/*.js" },
      skipFiles = {
        "${workspaceFolder}/node_modules/**/*.js",
        "<node_internals>/**",
      },
    },
    {
      type = "node2",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "node2",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end
