-- Theme engine for xghost.nvim
-- Loads and applies highlight groups
local M = {}

-- Helper function to set highlight groups
local function set_highlights(groups)
	for group, opts in pairs(groups) do
		if opts.link then
			-- Handle highlight links
			vim.api.nvim_set_hl(0, group, { link = opts.link })
		else
			-- Set highlight with attributes
			vim.api.nvim_set_hl(0, group, opts)
		end
	end
end

-- Helper function to merge highlight tables
local function merge_highlights(...)
	local result = {}
	for _, tbl in ipairs({ ... }) do
		for k, v in pairs(tbl) do
			result[k] = v
		end
	end
	return result
end

-- Load and apply the theme
function M.load(colors, config)
	-- Clear existing highlights
	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end

	-- Set termguicolors
	if vim.fn.has("termguicolors") == 1 then
		vim.o.termguicolors = true
	end

	-- Set colorscheme name
	vim.g.colors_name = "xghost"

	-- Load base highlight groups
	local base = require("xghost.groups.base")
	local highlights = base.get(colors, config)

	-- Load plugin-specific highlight groups
	if config.plugins.treesitter then
		local treesitter = require("xghost.groups.treesitter")
		highlights = merge_highlights(highlights, treesitter.get(colors, config))
	end

	if config.plugins.lsp then
		local lsp = require("xghost.groups.lsp")
		highlights = merge_highlights(highlights, lsp.get(colors, config))
	end

	if config.plugins.telescope then
		local telescope = require("xghost.groups.telescope")
		highlights = merge_highlights(highlights, telescope.get(colors, config))
	end

	if config.plugins.gitsigns then
		local git = require("xghost.groups.git")
		highlights = merge_highlights(highlights, git.get(colors, config))
	end

	if config.plugins.bufferline then
		local bufferline = require("xghost.groups.bufferline")
		highlights = merge_highlights(highlights, bufferline.get(colors, config))
	end

	if config.plugins.lualine then
		local lualine = require("xghost.groups.lualine")
		highlights = merge_highlights(highlights, lualine.get(colors, config))
	end

	if config.plugins.snacks then
		local snacks = require("xghost.groups.snacks")
		highlights = merge_highlights(highlights, snacks.get(colors, config))
	end

	if config.plugins.oil then
		local oil = require("xghost.groups.oil")
		highlights = merge_highlights(highlights, oil.get(colors, config))
	end

	-- Add additional common plugin highlights
	local extra_plugins = M.get_extra_plugin_highlights(colors, config)
	highlights = merge_highlights(highlights, extra_plugins)

	-- Apply user overrides
	if config.overrides and type(config.overrides) == "table" then
		highlights = merge_highlights(highlights, config.overrides)
	end

	-- Set all highlights
	set_highlights(highlights)

	-- Set terminal colors
	M.set_terminal_colors(colors)
end

-- Extra plugin highlights (NvimTree, Bufferline, etc.)
function M.get_extra_plugin_highlights(c, config)
	local hl = {}

	-- NvimTree
	if config.plugins.nvim_tree then
		local bg = config.darker_sidebar and c.bg_sidebar or c.bg
		local tree_fg = "#D2D7D6"
		local tree_muted = c.fg_dim
		local folder_closed = "#CFB08A"

		hl.NvimTreeNormal = { fg = tree_fg, bg = bg }
		hl.NvimTreeNormalNC = { fg = tree_fg, bg = bg }
		hl.NvimTreeWinSeparator = { fg = c.border, bg = bg }
		hl.NvimTreeRootFolder = { fg = c.warm, bold = true }
		hl.NvimTreeFolderName = { fg = folder_closed }
		hl.NvimTreeFolderIcon = { fg = folder_closed }
		hl.NvimTreeOpenedFolderName = { fg = c.warm, bold = true }
		hl.NvimTreeEmptyFolderName = { fg = tree_muted }
		hl.NvimTreeSymlink = { fg = c.cyan }
		hl.NvimTreeSpecialFile = { fg = c.orange }
		hl.NvimTreeImageFile = { fg = c.cyan }
		hl.NvimTreeIndentMarker = { fg = c.indent_guide }
		hl.NvimTreeCursorLine = { bg = c.bg_selection }
		hl.NvimTreeCursorLineNr = { fg = c.warm_bright, bg = bg }
		hl.NvimTreeGitDirty = { fg = c.git_change }
		hl.NvimTreeGitStaged = { fg = c.git_add }
		hl.NvimTreeGitMerge = { fg = c.git_change }
		hl.NvimTreeGitRenamed = { fg = c.git_change }
		hl.NvimTreeGitNew = { fg = c.git_add }
		hl.NvimTreeGitDeleted = { fg = c.git_delete }
		hl.NvimTreeGitIgnored = { fg = tree_muted }
		hl.NvimTreeGitUntracked = { fg = "#B3C2A1" }
		hl.NvimTreeSignColumn = { fg = c.fg_ui, bg = bg }
	end

	-- NeoTree
	if config.plugins.neo_tree then
		local bg = config.darker_sidebar and c.bg_sidebar or c.bg
		local tree_fg = "#D2D7D6"
		local tree_muted = c.fg_dim
		local folder_closed = "#CFB08A"

		hl.NeoTreeNormal = { fg = tree_fg, bg = bg }
		hl.NeoTreeNormalNC = { fg = tree_fg, bg = bg }
		hl.NeoTreeWinSeparator = { fg = c.border, bg = bg }
		hl.NeoTreeRootName = { fg = c.warm, bold = true }
		hl.NeoTreeFileName = { fg = tree_fg }
		hl.NeoTreeFileNameOpened = { fg = tree_fg }
		hl.NeoTreeFileIcon = { fg = tree_muted }
		hl.NeoTreeFolderIcon = { fg = folder_closed }
		hl.NeoTreeFolderName = { fg = folder_closed }
		hl.NeoTreeSymbolicLinkTarget = { fg = c.cyan }
		hl.NeoTreeGitAdded = { fg = c.git_add }
		hl.NeoTreeGitConflict = { fg = c.git_change }
		hl.NeoTreeGitDeleted = { fg = c.git_delete }
		hl.NeoTreeGitIgnored = { fg = tree_muted }
		hl.NeoTreeGitModified = { fg = c.git_change }
		hl.NeoTreeGitUntracked = { fg = "#B3C2A1" }
		hl.NeoTreeCursorLine = { bg = c.bg_selection }
		hl.NeoTreeIndentMarker = { fg = c.indent_guide }
	end

	-- Bufferline and Lualine now have dedicated highlight files
	-- See lua/xghost/groups/bufferline.lua and lua/xghost/groups/lualine.lua

	-- Indent Blankline
	if config.plugins.indent_blankline then
		hl.IblIndent = { fg = c.indent_guide }
		hl.IblScope = { fg = c.fg_dark }
		hl.IndentBlanklineChar = { fg = c.indent_guide }
		hl.IndentBlanklineContextChar = { fg = c.fg_dark }
	end

	-- Which-key
	hl.WhichKey = { fg = c.blue }
	hl.WhichKeyGroup = { fg = c.magenta }
	hl.WhichKeyDesc = { fg = c.fg_dark }
	hl.WhichKeySeperator = { fg = c.fg_ghost }
	hl.WhichKeySeparator = { fg = c.fg_ghost }
	hl.WhichKeyFloat = { bg = c.bg_float }
	hl.WhichKeyValue = { fg = c.cyan }

	-- Notify
	hl.NotifyERRORBorder = { fg = c.error, bg = c.bg_float }
	hl.NotifyWARNBorder = { fg = c.warning, bg = c.bg_float }
	hl.NotifyINFOBorder = { fg = c.info, bg = c.bg_float }
	hl.NotifyDEBUGBorder = { fg = c.hint, bg = c.bg_float }
	hl.NotifyTRACEBorder = { fg = c.magenta, bg = c.bg_float }
	hl.NotifyERRORIcon = { fg = c.error }
	hl.NotifyWARNIcon = { fg = c.warning }
	hl.NotifyINFOIcon = { fg = c.info }
	hl.NotifyDEBUGIcon = { fg = c.hint }
	hl.NotifyTRACEIcon = { fg = c.magenta }
	hl.NotifyERRORTitle = { fg = c.error, bold = true }
	hl.NotifyWARNTitle = { fg = c.warning, bold = true }
	hl.NotifyINFOTitle = { fg = c.info, bold = true }
	hl.NotifyDEBUGTitle = { fg = c.hint, bold = true }
	hl.NotifyTRACETitle = { fg = c.magenta, bold = true }

	return hl
end

-- Set terminal colors
function M.set_terminal_colors(c)
	-- Terminal colors (16 colors)
	vim.g.terminal_color_0 = c.bg -- Black
	vim.g.terminal_color_1 = c.red -- Red
	vim.g.terminal_color_2 = c.green -- Green
	vim.g.terminal_color_3 = c.yellow -- Yellow
	vim.g.terminal_color_4 = c.blue -- Blue
	vim.g.terminal_color_5 = c.magenta -- Magenta
	vim.g.terminal_color_6 = c.cyan -- Cyan
	vim.g.terminal_color_7 = c.fg_dark -- White

	-- Bright colors
	vim.g.terminal_color_8 = c.fg_ghost -- Bright Black (Gray)
	vim.g.terminal_color_9 = c.red -- Bright Red
	vim.g.terminal_color_10 = c.green -- Bright Green
	vim.g.terminal_color_11 = c.yellow -- Bright Yellow
	vim.g.terminal_color_12 = c.blue -- Bright Blue
	vim.g.terminal_color_13 = c.magenta -- Bright Magenta
	vim.g.terminal_color_14 = c.cyan -- Bright Cyan
	vim.g.terminal_color_15 = c.fg -- Bright White
end

return M
