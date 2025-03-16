return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			hightlight = {enable=true},
			indent = {enable=true},
			ensure_installed = {
				"c", "java", "lua", "html", "php", "json",
				"javascript", "css", "python", "bash", "bibtex", 
				"latex", "make", "llvm", "bert"
			},
			--playground = {
    			--	enable = true,
	    		--	disable = {},
    			--	updatetime = 50, -- Debounce time for highlighting
    			--	persist_queries = false, -- Whether the query should be remembered
    			--	keybindings = {
      			--		toggle_query_editor = 'o',
      			--		toggle_hl_groups = 'i',
      			--		toggle_injected_languages = 't',
			--		toggle_anonymous_nodes = 'a',
      			--		toggle_language_display = 'I',
      			--		focus_language = 'f',
      			--		unfocus_language = 'F',
      			--		update = 'R',
      			--		goto_node = '<cr>',
      			--		show_help = '?',
    			--	}
  			--},
			--incremental_selection = {
    			--	enable = true,
    			--	keymaps = {
    			--	  init_selection = "gnn", -- set to `false` to disable one of the mappings
    			--	  node_incremental = "grn",
    			--	  scope_incremental = "grc",
    			--	  node_decremental = "grm",
    			--	}
  			--},
		})
	end
}
