-- source https://github.com/rodrigoscc/http.nvim

local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


local bash = {
  snip({
      trig = "#!",
      namr = "Shebang",
      dscr = "'Standard' 'POSIX' Shebang"
    },
    { text('#!/usr/bin/env bash'), }
  ),

}

ls.add_snippets(nil, { bash = bash, sh = bash })
