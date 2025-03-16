local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
local line = t({ "", "" })

local function copy(args)
	return args[1]
end

ls.add_snippets("tex", {
	s(
		"env",
		fmt(
			[[
			\begin{{{}}}
				{}
			\end{{{}}}]],
			{
				i(1),
				i(2, "content"),
				f(copy, 1),
			}
		)
	),
	s(
		"basic setup",
		fmt(
			[[
\documentclass{{article}}

\usepackage[utf8]{{inputenc}}
\usepackage{{unicode-helper}}
\usepackage{{amsmath}}
\usepackage{{amssymb}}
\usepackage{{amsfonts}}
\usepackage{{microtype}}
\usepackage[english]{{babel}}
\usepackage{{amsthm}}
\usepackage{{mathtools}}
\usepackage{{braket}}
\usepackage[pdftex]{{hyperref}}
\usepackage{{cleveref}}

\newcommand{{\titlevar}}{{{title}}}
\newcommand{{\authorvar}}{{{author}}}
\newcommand{{\datevar}}{{{date}}}
\title{{\titlevar}}
\author{{\authorvar}}
\date{{\datevar}}
\hypersetup{{
	pdftitle=\titlevar,
	pdfauthor=\authorvar,
	pdfcreationdate=\datevar,
}}
\setlength{{\parindent}}{{0pt}}]],
			{
				title = i(1, "Title"),
				author = i(2, "Author"),
				date = i(3, "Date"),
			}
		)
	),
})
