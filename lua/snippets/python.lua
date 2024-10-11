local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date_yyyy_mm_dd = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
	python = {
		snip({
				trig = "def",
				namr = "Define function",
				dscr = "Define a basic python function"
			},
			{
				text('def '),
				insert(1, "func_name"),
				text('('),
				insert(2, "args"),
				text(') -> '),
				insert(3, "type"),
				text(': ...'),
			}
			),
	},
})

