-- Lazy.nvim plugin specification for xghost.nvim
return {
	"qdrtech/xghost.nvim",
	name = "xghost",
	lazy = false, -- Load during startup since it's a colorscheme
	priority = 1000, -- Ensure it loads before other plugins
	opts = {
		style = "default",
		transparent = false,
		italic_comments = true,
		plugins = {
			treesitter = true,
			lsp = true,
			telescope = true,
			gitsigns = true,
			nvim_tree = true,
			neo_tree = true,
			bufferline = true,
			lualine = true,
			snacks = true,
			oil = true,
		},
	},
	config = function(_, opts)
		require("xghost").setup(opts)
		vim.cmd.colorscheme("xghost")
	end,
}
