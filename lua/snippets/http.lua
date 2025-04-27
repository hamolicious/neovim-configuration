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

local http = {
  snip({
      trig = "request",
      namr = "New Request",
      dscr = "Create new basic request"
    },
    {
      text({
        "@request.title=JSON",
        "POST https://example.hehe",
        "User-Agent: test-request",
        "Accept: application/json",
        "Content-Type: application/json",
        "",
        "{",
        "",
        "}",
      }),
    }
  ),



  snip({
      trig = "title",
      namr = "Set request title",
      dscr = "Request title"
    },
    {
      text('@request.title = '),
      insert(1, 'Request Title')
    }),


  snip({
      trig = "after_hook",
      namr = "request.after_hook",
      dscr = "Request after hook"
    },
    {
      text('@request.after_hook = '),
      insert(1, 'save_access_token')
    }),

  snip({
      trig = "before_hook",
      namr = "request.before_hook",
      dscr = "Request before hook"
    },
    {
      text('@request.before_hook = '),
      insert(1, 'ask_for_confirmation')
    }),

  snip({
      trig = "#",
      namr = "Request split",
      dscr = "Insert `###` request splitter"
    },
    {
      text({
        '',
        '###',
        ''
      }),
    }),
}

ls.add_snippets(nil, {
  http = http,
  http2 = http,
})
