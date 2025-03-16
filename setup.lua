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

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.bert = {
	install_info = {
		url = "~/Documents/code/WS25/Bert-Grammar", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		--branch = "main", -- default branch in case of git repo if different from master
		--generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		--requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	--filetype = "zu", -- if filetype does not match the parser name
}

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
