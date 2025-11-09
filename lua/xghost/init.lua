-- xghost.nvim - A minimalist, macOS-inspired Neovim theme
-- Main entry point
local M = {}

-- Track if setup has been called
local _setup_called = false

-- Setup function - called by user to configure the theme
function M.setup(opts)
	local config = require("xghost.config")
	config.setup(opts)
	_setup_called = true
	
	-- Automatically load the theme after setup
	M.load()
end

-- Load the theme
function M.load()
	-- Auto-setup with defaults if setup() was never called
	if not _setup_called then
		local config = require("xghost.config")
		config.setup({}) -- Use defaults
		_setup_called = true
	end

	local config = require("xghost.config")
	local color_loader = require("xghost.colors")
	local theme = require("xghost.theme")

	-- Get current configuration
	local cfg = config.get()

	-- Load color palette based on style
	local colors = color_loader.load(cfg.style)

	-- Apply the theme
	theme.load(colors, cfg)
end

-- Utility function to get available styles
function M.get_styles()
	local color_loader = require("xghost.colors")
	return color_loader.get_styles()
end

-- Utility function to get current colors
function M.get_colors()
	local config = require("xghost.config")
	local color_loader = require("xghost.colors")
	local cfg = config.get()
	return color_loader.load(cfg.style)
end

-- Utility function to switch style at runtime
function M.set_style(style)
	local config = require("xghost.config")
	config.options.style = style
	M.load()
end

return M
