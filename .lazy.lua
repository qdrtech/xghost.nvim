-- Lazy.nvim plugin specification for xghost.nvim
return {
	"qdrtech/xghost.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("xghost").setup({
			-- Configuration options (all optional)
			-- style = "default",
			-- transparent = false,
			-- italic_comments = true,
			-- italic_keywords = false,
			-- bold_keywords = true,
			-- darker_sidebar = true,
		})

		-- Load the colorscheme
		vim.cmd([[colorscheme xghost]])
	end,
}
