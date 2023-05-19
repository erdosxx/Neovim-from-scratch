local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node
local autosnippet =
	ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	autosnippet(
		{ trig = "df", name = "def function", dscr = "define function" },
		fmta(
			[[
      function <>(<>)
        <>
      end
      <>
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(0),
			}
		),
		{ condition = line_begin }
	),
	autosnippet(
		{ trig = "dm", name = "def macro", dscr = "define macro" },
		fmta(
			[[
      macro <>(<>)
        <>
      end
      <>
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(0),
			}
		),
		{ condition = line_begin }
	),
}
