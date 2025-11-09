-- Snacks.nvim highlight groups for xghost.nvim
-- File explorer, picker, and other snacks components
local M = {}

function M.get(c, config)
	local hl = {}
	local bg = config.darker_sidebar and c.bg_sidebar or c.bg
	local tree_fg = c.sidebar_text or c.fg
	local tree_muted = c.sidebar_muted or c.fg_dim
	local folder_closed = c.folder_closed or c.warm
	local git_untracked = c.git_untracked or c.git_change

	-- Helper to determine bold based on font_style
	local function use_bold_for(element_type)
		if config.font_style == "bold" then
			return true
		elseif config.font_style == "semi_bold" then
			return element_type == "ui" or element_type == "emphasis"
		elseif config.font_style == "regular" then
			return element_type == "emphasis"
		end
		return true
	end

	-- Snacks Picker (Telescope-like interface)
	hl.SnacksPickerNormal = { fg = c.fg, bg = c.bg_float }
	hl.SnacksPickerBorder = { fg = c.border, bg = c.bg_float }
	hl.SnacksPickerTitle = { fg = c.blue, bg = c.bg_float, bold = use_bold_for("ui") }
	hl.SnacksPickerPrompt = { fg = c.fg, bg = c.bg_float }
	hl.SnacksPickerMatch = { fg = c.blue, bold = use_bold_for("ui") }
	hl.SnacksPickerSelected = { fg = c.fg, bg = c.bg_selection, bold = use_bold_for("ui") }
	hl.SnacksPickerCurrent = { bg = c.bg_highlight }

	-- Snacks Explorer (File tree) - spec section 8
	hl.SnacksExplorerNormal = { fg = tree_fg, bg = bg }
	hl.SnacksExplorerBorder = { fg = c.border, bg = bg }
	hl.SnacksExplorerTitle = { fg = c.warm, bg = bg, bold = use_bold_for("ui") }

	-- File/folder items (spec section 8)
	hl.SnacksExplorerDir = { fg = c.warm }
	hl.SnacksExplorerDirClosed = { fg = folder_closed }
	hl.SnacksExplorerFile = { fg = tree_fg }
	hl.SnacksExplorerHidden = { fg = tree_muted }
	hl.SnacksExplorerSymlink = { fg = c.cyan }
	hl.SnacksExplorerExecutable = { fg = c.green }

	-- Git decorations in tree (spec section 8)
	hl.SnacksExplorerGitAdd = { fg = c.green }
	hl.SnacksExplorerGitChange = { fg = c.blue }
	hl.SnacksExplorerGitDelete = { fg = c.red }
	hl.SnacksExplorerGitIgnored = { fg = tree_muted }
	hl.SnacksExplorerGitUntracked = { fg = git_untracked }

	-- Icons and indent markers
	hl.SnacksExplorerIcon = { fg = c.fg_dark }
	hl.SnacksExplorerIndent = { fg = c.indent_guide }

	-- Selection and cursor (spec section 8: selection with left bar accent.cyan)
	hl.SnacksExplorerCursor = { bg = c.bg_selection }
	hl.SnacksExplorerSelected = { fg = c.fg, bg = c.bg_selection }
	hl.SnacksExplorerSelectedBar = { fg = c.cyan }

	-- Snacks Picker built-in highlight groups (used by Explorer internally)
	hl.SnacksPickerTree = { fg = c.indent_guide }
	hl.SnacksPickerDirectory = { fg = c.warm }
	hl.SnacksPickerDir = { fg = tree_muted }
	hl.SnacksPickerFile = { fg = tree_fg }
	hl.SnacksPickerHidden = { fg = tree_muted }
	hl.SnacksPickerPathHidden = { fg = tree_muted }
	hl.SnacksPickerPathIgnored = { fg = tree_muted }
	hl.SnacksPickerSelected = { fg = c.fg, bg = c.bg_selection, bold = use_bold_for("ui") }
	hl.SnacksPickerToggle = { fg = c.cyan }
	hl.SnacksPickerLink = { fg = c.cyan }
	hl.SnacksPickerGitStatusAdded = { fg = c.green }
	hl.SnacksPickerGitStatusModified = { fg = c.blue }
	hl.SnacksPickerGitStatusDeleted = { fg = c.red }
	hl.SnacksPickerGitStatusIgnored = { fg = tree_muted }
	hl.SnacksPickerGitStatusUntracked = { fg = git_untracked }

	-- Snacks Dashboard
	hl.SnacksDashboardNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg }
	hl.SnacksDashboardHeader = { fg = c.blue, bold = use_bold_for("ui") }
	hl.SnacksDashboardFooter = { fg = c.fg_dark }
	hl.SnacksDashboardIcon = { fg = c.orange }
	hl.SnacksDashboardKey = { fg = c.magenta, bold = use_bold_for("ui") }
	hl.SnacksDashboardDesc = { fg = c.fg_dark }
	hl.SnacksDashboardFile = { fg = c.fg }
	hl.SnacksDashboardDir = { fg = c.blue }
	hl.SnacksDashboardShortcut = { fg = c.cyan }

	-- Snacks Notifier
	hl.SnacksNotifierError = { fg = c.error, bg = c.bg_float }
	hl.SnacksNotifierWarn = { fg = c.warning, bg = c.bg_float }
	hl.SnacksNotifierInfo = { fg = c.info, bg = c.bg_float }
	hl.SnacksNotifierDebug = { fg = c.hint, bg = c.bg_float }
	hl.SnacksNotifierTrace = { fg = c.magenta, bg = c.bg_float }

	hl.SnacksNotifierErrorBorder = { fg = c.error, bg = c.bg_float }
	hl.SnacksNotifierWarnBorder = { fg = c.warning, bg = c.bg_float }
	hl.SnacksNotifierInfoBorder = { fg = c.info, bg = c.bg_float }
	hl.SnacksNotifierDebugBorder = { fg = c.hint, bg = c.bg_float }
	hl.SnacksNotifierTraceBorder = { fg = c.magenta, bg = c.bg_float }

	hl.SnacksNotifierErrorTitle = { fg = c.error, bold = use_bold_for("ui") }
	hl.SnacksNotifierWarnTitle = { fg = c.warning, bold = use_bold_for("ui") }
	hl.SnacksNotifierInfoTitle = { fg = c.info, bold = use_bold_for("ui") }
	hl.SnacksNotifierDebugTitle = { fg = c.hint, bold = use_bold_for("ui") }
	hl.SnacksNotifierTraceTitle = { fg = c.magenta, bold = use_bold_for("ui") }

	hl.SnacksNotifierErrorIcon = { fg = c.error }
	hl.SnacksNotifierWarnIcon = { fg = c.warning }
	hl.SnacksNotifierInfoIcon = { fg = c.info }
	hl.SnacksNotifierDebugIcon = { fg = c.hint }
	hl.SnacksNotifierTraceIcon = { fg = c.magenta }

	return hl
end

return M
