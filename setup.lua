require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

require("lspconfig").pyright.setup({})
require("lspconfig").digestif.setup({})
require("lspconfig").clangd.setup({
	capabilities = {
		offsetEncoding = { "utf-8", "utf-16" },
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
})
require("lspconfig").selene3p_ls.setup({})
require("lspconfig").stylua3p_ls.setup({})
