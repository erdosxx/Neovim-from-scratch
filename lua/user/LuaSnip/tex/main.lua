local helpers = require("user.LuaSnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual

local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local sn = ls.snippet_node
local d = ls.dynamic_node
local f = ls.function_node
local t = ls.text_node
local ai = require("luasnip.nodes.absolute_indexer")
local postfix = require("luasnip.extras.postfix").postfix
local c = ls.choice_node
local isn = ls.indent_snippet_node
local r = ls.restore_node
local extras = require("luasnip.extras")
local l = extras.lambda
local m = extras.match

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex_utils = {}
tex_utils.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex_utils.in_equation = function()
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function()
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function()
	return tex_utils.in_env("tikzpicture")
end

local function fn(args, parent, user_args)
	return "[" .. args[1][1] .. user_args .. "]"
end

local function reused_func(_, _, user_args)
	return user_args
end

local function count(_, _, old_state)
	old_state = old_state or {
		updates = 0,
	}

	old_state.updates = old_state.updates + 1

	local snip = sn(nil, {
		t(tostring(old_state.updates)),
	})

	snip.old_state = old_state
	return snip
end

local function simple_restore(args, _)
	return sn(nil, { i(1, args[1]), r(2, "dyn", i(nil, "user_text")) })
end

return {
	s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
	s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
	s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
	s({
		trig = "tt",
		dscr = "Expands 'tt' into '\texttt{}'",
	}, fmta("\\textt{<>}", { i(1) })),
	s(
		{
			trig = "([^%a])ff",
			regTrig = true,
			wordTrig = false,
		},
		fmta([[<>\frac{<>}{<>}]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		})
	),
	s(
		{ trig = "eq", desc = "A LaTeX equation environment" },
		fmta(
			[[
				\begin{equation}
					<>
				\end{equation}
			]],
			{ i(0) }
		)
	),
	s(
		{
			trig = "env",
			snippetType = "autosnippet",
		},
		fmta(
			[[
				\begin{<>}
				<>
				\end{<>}
			]],
			{
				i(1),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s(
		{
			trig = "hr",
			dscr = "The hyperref package's href{}{} command (for url links)",
		},
		fmta([[\href{<>}{<>}]], {
			i(1, "url"),
			i(2, "display name"),
		})
	),
	s(
		{ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}", {
			d(1, get_visual),
		})
	),
	s(
		{
			trig = "mm",
			dscr = "mm in the beginning of line generates $ capture_text $",
			regTrig = true,
			wordTrig = false,
		},
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),
	s(
		{
			trig = "([^%a])mm",
			dscr = "mm with non alpha numeric prefix generates $ capture_text $",
			regTrig = true,
			wordTrig = false,
		},
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
	s(
		{ trig = "([^%a])ee", regTrig = true, wordTrig = false },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "ee", regTrig = true, wordTrig = false },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex_utils.in_mathzone + line_begin }
	),
	s(
		{
			trig = "([%a%)%]%}])00",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(0, "0"),
			--[[ t("0"), ]]
		})
	),
	s(
		{ trig = "h1", dscr = "Top-level section" },
		fmta([[\section{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "new", dscr = "A generic new environment" },
		fmta(
			[[
				\begin{<>}
				<>
				\end{<>}
			]],
			{
				i(1),
				i(2),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "ff" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		}),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "dd" },
		fmta("\\draw [<>] ", {
			i(1, "params"),
		}),
		{ condition = tex_utils.in_tikz }
	),
	s(
		{ trig = "df", snippetType = "autosnippet" },
		{ t("\\diff") },
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "sd", snippetType = "autosnippet", wordTrig = false },
		fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
		{ condition = tex_utils.in_mathzone }
	),
	postfix(".br", {
		f(function(_, parent)
			return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
		end, {}),
	}),
	s(
		"ternary",
		{ i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else") }
	),
	s(
		{ trig = "b([^%d]+)", regTrig = true },
		f(function(args, snip)
			return "Captured Text: " .. snip.captures[1] .. "."
		end, {})
	),
	s("isn2", {
		isn(
			1,
			t({ "//This is", "A multiline", "comment" }),
			"$PARENT_INDENT##"
		),
	}),
	s(
		"choice",
		c(1, {
			t("Ugh boring, a text node"),
			i(nil, "At least I can edit something now..."),
			f(function(args)
				return "Still only counts as text!!"
			end, {}),
		})
	),
	s("trig", {
		i(1),
		t(":"),
		i(2),
		t("::"),
		m({ 1, 2 }, l._1:match("^" .. l._2 .. "$"), l._1:gsub("a", "e")),
	}),
	s("extras1", {
		i(1),
		t({ "", "" }),
		m(1, "^ABC$", "A"),
	}),
	s("extras2", {
		i(1, "INPUT"),
		t({ "", "" }),
		m(1, l._1:match(l._1:reverse()), "PALINDROME"),
	}),
	s("extras3", {
		i(1),
		t({ "", "" }),
		i(2),
		t({ "", "" }),
		m({ 1, 2 }, l._1:match("^" .. l._2 .. "$"), l._1:gsub("a", "e")),
	}),
	s("extras4", { i(1), t({ "", "" }), extras.rep(1) }),
	s("extras5", { extras.partial(os.date, "%Y %M %b") }),
	s(
		"extras6",
		{ i(1, ""), t({ "", "" }), extras.nonempty(1, "not empty!", "empty!") }
	),
	s(
		"extras7",
		{ i(1), t({ "", "" }), extras.dynamic_lambda(2, l._1 .. l._1, 1) }
	),
	s("paren_change", {
		c(1, {
			sn(nil, { t("("), r(1, "user_text"), t(")") }),
			sn(nil, { t("["), r(1, "user_text"), t("]") }),
			sn(nil, { t("{"), r(1, "user_text"), t("}") }),
		}),
	}, {
		stored = {
			["user_text"] = i(1, "default_text"),
		},
	}),
	s("rest", {
		i(1, "preset"),
		t({ "", "" }),
		d(2, simple_restore, 1),
	}),
}
