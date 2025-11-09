-- xghost.nvim configuration
local M = {}

-- Default configuration
M.defaults = {
	-- Theme style: "default", "dark", "light", "warm"
	style = "default",

	-- Enable/disable transparent background
	transparent = false,

	-- Enable/disable italic comments
	italic_comments = true,

	-- Enable/disable italic keywords
	italic_keywords = false,

	-- Enable/disable bold keywords
	bold_keywords = true,

	-- Font style for emphasis (keywords, statements, etc.)
	-- Options: "bold" (default), "semi_bold", "regular"
	-- "semi_bold" removes bold from keywords while keeping it for UI elements (macOS aesthetic)
	-- "regular" removes bold from keywords and most UI (minimal style)
	font_style = "bold",

	-- Hide inactive statusline
	hide_inactive_statusline = false,

	-- Darker sidebar (NvimTree, Telescope, etc.)
	darker_sidebar = true,

	-- Override specific highlight groups
	overrides = {},

	-- Plugin integrations
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
		indent_blankline = true,
	},
}

-- Current configuration
M.options = vim.deepcopy(M.defaults)

-- Setup function to merge user config with defaults
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

-- Get current config
function M.get()
	return M.options
end

return M
