local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local autosnippet =
	ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local capture = function(_, parent, user_args)
	return parent.captures[user_args]
end

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
	autosnippet(
		{
			trig = "dg",
			name = "def gen function",
			dscr = "define generated function",
		},
		fmta(
			[[
      @generated function <>(<>)
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
		{
			trig = "ds",
			name = "def struct",
			dscr = "define structure",
		},
		fmta(
			[[
      struct <>
        <>
      end
      <>
      ]],
			{
				i(1),
				i(2),
				i(0),
			}
		),
		{ condition = line_begin }
	),
	autosnippet(
		{
			trig = "if",
			name = "if",
			dscr = "if with end",
		},
		fmta(
			[[
      if <>
        <>
      end
      <>
      ]],
			{
				i(1),
				i(2),
				i(0),
			}
		),
		{ condition = line_begin }
	),
	autosnippet(
		{
			trig = "for",
			name = "for",
			dscr = "for with end",
		},
		fmta(
			[[
      for <> in <>
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
		{
			trig = "abt",
			name = "abstract type",
			dscr = "abstract type",
		},
		fmta(
			[[
      abstract type <> end
      <>
      ]],
			{
				i(1),
				i(0),
			}
		),
		{ condition = line_begin }
	),
	autosnippet(
		{
			trig = "try",
			name = "try",
			dscr = "try block",
		},
		fmta(
			[[
      try
        <>
      catch <>
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
		{
			trig = "([%a%d(]+)@",
			name = "::",
			dscr = "input :: for type",
			regTrig = true,
			wordTrig = false,
		},
		fmta([[<>::<>]], {
			f(capture, {}, { user_args = { 1 } }),
			i(0),
		}),
		{}
	),
}
