Joni = {}
Joni.c = {}
Joni.latex = {}
Joni.lua = {}
--Joni.cpp = {}

local luasnip = require("luasnip")

function Joni.file_starts_with(file, string)
	io.input(file)
	return io.read(#string) == string
end

function Joni.chars(string)
	t = {}
	string.gsub(string, ".", function(c)
		table.insert(t, c)
	end)
	return t
end

function Joni.open_file(file)
	os.execute(string.format('open "%s" > /dev/null 2>&1', file))
end

function Joni.c.reformat_current()
	local current_file = vim.fn.expand("%")
	os.execute(string.format('clang-format -i "%s"', current_file))
	vim.cmd("edit")
end

function Joni.lua.reformat_current()
	local current_file = vim.fn.expand("%")
	os.execute(string.format('stylua "%s"', current_file))
	vim.cmd("edit")
end

function Joni.latex.compile_latex()
	local current_file = vim.fn.expand("%")
	if Joni.file_starts_with(current_file, "%no-autocompile") then
		return
	end
	current_file = string.gsub(current_file, ".tex", "") -- Removing suffix
	os.execute(
		string.format(
			'texfot pdflatex -synctex=1 -interaction=nonstopmode "%s.tex" > "%s.errors"',
			current_file,
			current_file
		)
	)
	vim.cmd("edit")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-L>", true, false, true), "n", true)
	Joni.open_file(current_file .. ".pdf")
end

function Joni.autoreformat(language, extension)
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = string.format("*.%s", extension),
		callback = language.reformat_current,
	})
end

Joni.autoreformat(Joni.c, "c")
Joni.autoreformat(Joni.c, "h")
Joni.autoreformat(Joni.c, "cpp")
Joni.autoreformat(Joni.c, "hpp")
Joni.autoreformat(Joni.lua, "lua")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.tex",
	callback = Joni.latex.compile_latex,
})

vim.keymap.set(Joni.chars("i"), "<C-K>", function()
	print("Hello")
	luasnip.expand()
end, { silent = true })
vim.keymap.set(Joni.chars("is"), "<C-L>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set(Joni.chars("is"), "<C-J>", function()
	luasnip.jump(-1)
end, { silent = true })

vim.keymap.set(Joni.chars("is"), "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

vim.keymap.set(Joni.chars("vnix"), "<C-s>", "<Esc>:w<CR>")
vim.keymap.set(Joni.chars("vnix"), "<C-O>", "<Esc>:NvimTreeOpen<CR>")
vim.keymap.set(Joni.chars("n"), "w", "<Esc>:q<CR>")
vim.keymap.set(Joni.chars("vnix"), "vb", "<Esc>")
vim.keymap.set(Joni.chars("vnix"), "<F5>", "<Esc>:!make<CR>")
vim.keymap.set(Joni.chars("vnix"), "<F1>", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set(Joni.chars("n"), "<C-f>", "<Esc>:FzfLua grep<CR><CR>")
vim.cmd("inoremap <C-Space> <C-x><C-o>")

require("snippets")
require("treesitter_bert")
