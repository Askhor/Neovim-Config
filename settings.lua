vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.cmd.colorscheme("habamax")
vim.opt.scrolloff = 12

vim.api.nvim_create_augroup("cpp_indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})

vim.opt.clipboard = "unnamedplus"
local clipboard_copy_command = { "gpaste-client", "add" }
local clipboard_paste_command = { "gpaste-client", "--raw", "--use-index", "get", "0" }
vim.g.clipboard = {
	name = "GPaste",
	copy = {
		["+"] = clipboard_copy_command,
		["*"] = clipboard_copy_command,
	},
	paste = {
		["+"] = clipboard_paste_command,
		["*"] = clipboard_paste_command,
	},
	cache_enabled = 0,
}
