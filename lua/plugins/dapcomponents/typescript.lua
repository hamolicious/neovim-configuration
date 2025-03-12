-- source https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/

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
  }
end

require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

require('dap').adapters['node'] = require('dap').adapters['pwa-node']

local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

local vscode = require("dap.ext.vscode")
vscode.type_to_filetypes["node"] = js_filetypes
vscode.type_to_filetypes["pwa-node"] = js_filetypes


require('dap.ext.vscode').load_launchjs(nil,
  {
    ['node2'] = js_based_languages,
    ['pwa-node'] = js_based_languages,
    ['node'] = js_based_languages,
    ['chrome'] = js_based_languages,
    ['pwa-chrome'] = js_based_languages
  }
)
