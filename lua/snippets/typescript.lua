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
	all = {
		snip({
			trig = "log",
			namr = "console.log",
			dscr = "",
		}, {
			text("console.log(JSON.stringify("),
			insert(1, "data"),
			text("))"),
		}),
		snip({
			trig = "eaf",
			namr = "export async function",
			dscr = "",
		}, {
			text("export async function"),
			insert(1, "function_name"),
			text("("),
			insert(2, "function_args"),
			text(")"),
			text("{};"),
		}),
		-- left as an example
		snip({
				trig = "meta",
				namr = "Metadata",
				dscr = "Yaml metadata format for markdown"
			},
			{
				text({ "---", "title: " }),
				insert(1, "note_title"),
				text({ "", "author: " }),
				insert(2, "author"),
				text({ "", "date: " }),
				func(date_yyyy_mm_dd, {}),
				text({ "", "categories: [" }), insert(3, ""),
				text({ "]", "lastmod: " }),
				func(date_yyyy_mm_dd, {}),
				text({ "", "tags: [" }),
				insert(4),
				text({ "]", "comments: true", "---", "" }),
				insert(0)
			}),
	},
})
