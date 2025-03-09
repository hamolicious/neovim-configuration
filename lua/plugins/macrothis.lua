return {
  "desdic/macrothis.nvim",
  opts = {
    datafile = vim.fn.stdpath("config") .. "/macrothis.json",
    run_register = "q",
    editor = {
      width = 100,
      height = 2,
      style = "minimal",
      border = "rounded",
    },
    clipboard_register = '+',
    default_register = "q",
  },
  keys = {
    {
      "<leader>mw",
      function()
        require('macrothis').save()
      end,
      desc = "save register/macro"
    },
    {
      "<leader>ml",
      function()
        require('macrothis').load()
      end,
      desc = "load register/macro"
    },
    {
      "<leader>md",
      function()
        require('macrothis').delete()
      end,
      desc = "delete register/macro"
    },
    {
      "<leader>mq",
      function()
        require('macrothis').quickfix()
      end,
      desc = "run on quickfix list"
    },
    {
      "<leader>mr",
      function()
        require('macrothis').run()
      end,
      desc = "run macro"
    },
    {
      "<leader>mx",
      function()
        require('macrothis').register()
      end,
      desc = "edit register"
    },
    {
      "F12",
      function()
        require('macrothis').copy_register_printable()
      end,
      desc = "copy register as printable"
    },
    {
      "F12",
      function()
        require('macrothis').copy_macro_printable()
      end,
      desc = "copy macro as printable"
    }
  }
}
