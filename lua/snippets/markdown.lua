local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local markdown = {}
for _, value in ipairs({ 'python', 'typescript', 'c', 'cpp', 'javascript', 'bash' }) do
  table.insert(
    markdown,
    snip({
      trig = value,
      namr = "code block",
      dscr = "creates a codeblock",
    }, {
      text({
        '```' .. value,
        '```',
      }),
    })
  )
end

local extras = {
  snip({
    trig = "block",
    namr = "code block",
    dscr = "creates a codeblock",
  }, {
    text('```'),
    insert(1, ''),
    text('```'),
  }),
  snip({
    trig = "[]",
    namr = "[]  - [ ]",
    dscr = "Expand md brackets",
  }, {
    text('- [ ]')
  }),
  snip({
    trig = "[x]",
    namr = "[x]  - [x]",
    dscr = "Expand md brackets",
  }, {
    text('- [x]')
  }),
  snip({
      trig = "h1",
      namr = "h1",
      dscr = "Heading 1"
    },
    {
      text('# '),
    }
  ),
  snip({
      trig = "h2",
      namr = "h2",
      dscr = "Heading 2"
    },
    {
      text('## '),
    }
  ),
  snip({
      trig = "h3",
      namr = "h3",
      dscr = "Heading 3"
    },
    {
      text('### '),
    }
  ),
  snip({
      trig = "h4",
      namr = "h4",
      dscr = "Heading 4"
    },
    {
      text('#### '),
    }
  ),
  snip({
      trig = "h5",
      namr = "h5",
      dscr = "Heading 5"
    },
    {
      text('##### '),
    }
  ),
  snip({
      trig = "h6",
      namr = "h6",
      dscr = "Heading 6"
    },
    {
      text('###### '),
    }
  ),
}


for _, value in ipairs(extras) do
  table.insert(markdown, value)
end

ls.add_snippets(nil, { markdown = markdown })
