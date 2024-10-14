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
	python = {
		snip({
				trig = "annot",
				namr = "Annotations",
				dscr = "Import annotations from future"
			},
			{
				text('from __future__ import annotations'),
			}
		),
		snip({
				trig = "from",
				namr = "From * import *",
				dscr = "Import packages from modules"
			},
			{
				text('from '),
				insert(1, "module "),
				text('import '),
				insert(2, "package"),
			}
		),
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
		snip({
				trig = "main",
				namr = "main() and __main__",
				dscr = "Adds a main func and __main__ check"
			},
			{
				text({
					'def main() -> None:',
					'\t...',
					'',
					'if __name__ == \'__main__\':',
					'\t...',
				})
			}
		),
	}
})
