local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


ls.add_snippets(nil, {
	markdown = {
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
})
