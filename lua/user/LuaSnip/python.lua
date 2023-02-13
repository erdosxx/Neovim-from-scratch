local helpers = require("user.LuaSnip.luasnip-helper-funcs")
local get_visual_new = helpers.get_visual_new
local get_visual = helpers.get_visual

local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
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

local autosnippet =
	ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

local make_condition = require("luasnip.extras.conditions").make_condition

-- not work: can check with :echo vimtex#syntax#in("texMintedZonePython")
local function mintedPython()
	return vim.fn["vimtex#syntax#in"]("texMintedZonePython") == 1
end

local function tex()
	return vim.bo.filetype == "tex"
end

local function python()
	return vim.bo.filetype == "python"
end

local function env(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function minted()
	return env("minted")
end

local pyfile = make_condition(python)
local texfile = make_condition(tex)
local pymint = make_condition(mintedPython)
local in_minted = make_condition(minted)

return {
	autosnippet({
		trig = "pytest",
		name = "pytest",
		dscr = "test condition for python",
	}, {
		t(
			"this triggers only in python files, "
				.. "or in tex files with minted enabled"
		),
	}, {
		--[[ condition = pyfile + (texfile * pymint), ]]
		--[[ show_condition = pyfile + (texfile * pymint), ]]
		condition = pyfile + (texfile * in_minted),
		show_condition = pyfile + (texfile * in_minted),
	}),
	autosnippet(
		{ trig = "vfor", name = "trig", dscr = "dscr" },
		fmta(
			[[
      for <> in <>:
        <>
      ]],
			-- leave the first table blank; that's for args which we are not using
			{
				i(1),
				i(2),
				d(3, get_visual_new, {}, { user_args = { "pass" } }),
			}
		)
	),
}