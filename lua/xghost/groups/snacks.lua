-- Snacks.nvim highlight groups for xghost.nvim
-- File explorer, picker, and other snacks components
local M = {}

function M.get(c, config)
	local hl = {}
	local bg = config.darker_sidebar and c.bg_sidebar or c.bg

	-- Snacks Picker (Telescope-like interface)
	hl.SnacksPickerNormal = { fg = c.fg, bg = c.bg_float }
	hl.SnacksPickerBorder = { fg = c.border, bg = c.bg_float }
	hl.SnacksPickerTitle = { fg = c.blue, bg = c.bg_float, bold = true }
	hl.SnacksPickerPrompt = { fg = c.fg, bg = c.bg_float }
	hl.SnacksPickerMatch = { fg = c.blue, bold = true }
	hl.SnacksPickerSelected = { fg = c.fg, bg = c.bg_visual, bold = true }
	hl.SnacksPickerCurrent = { bg = c.bg_highlight }

	-- Snacks Explorer (File tree) - spec section 8
	hl.SnacksExplorerNormal = { fg = "#D2D7D6", bg = bg } -- Default text from spec
	hl.SnacksExplorerBorder = { fg = c.border, bg = bg }
	hl.SnacksExplorerTitle = { fg = c.warm, bg = bg, bold = true } -- Warm accent for titles

	-- File/folder items (spec section 8)
	hl.SnacksExplorerDir = { fg = c.warm, bold = true } -- Open folder: warm, semibold
	hl.SnacksExplorerDirClosed = { fg = "#CFB08A" } -- Closed folder: dimmer warm
	hl.SnacksExplorerFile = { fg = "#D2D7D6" } -- Regular files
	hl.SnacksExplorerHidden = { fg = c.fg_dim } -- Muted (dotfiles, ignored)
	hl.SnacksExplorerSymlink = { fg = c.cyan }
	hl.SnacksExplorerExecutable = { fg = c.green }

	-- Git decorations in tree (spec section 8)
	hl.SnacksExplorerGitAdd = { fg = c.green } -- Added: accent.green
	hl.SnacksExplorerGitChange = { fg = c.blue } -- Modified: accent.blue
	hl.SnacksExplorerGitDelete = { fg = c.red } -- Removed: accent.red
	hl.SnacksExplorerGitIgnored = { fg = c.fg_dim }
	hl.SnacksExplorerGitUntracked = { fg = "#B3C2A1" } -- Untracked: from spec

	-- Icons and indent markers
	hl.SnacksExplorerIcon = { fg = c.fg_dark }
	hl.SnacksExplorerIndent = { fg = c.fg_ghost }

	-- Selection and cursor (spec section 8: selection with left bar accent.cyan)
	hl.SnacksExplorerCursor = { bg = c.bg_selection } -- Selection row bg from spec
	hl.SnacksExplorerSelected = { fg = c.fg, bg = c.bg_selection } -- Keep text normal, bg selection
	hl.SnacksExplorerSelectedBar = { fg = c.cyan } -- Left bar in cyan (2px)

	-- Snacks Picker built-in highlight groups (used by Explorer internally)
	hl.SnacksPickerTree = { fg = c.indent_guide }
	hl.SnacksPickerDirectory = { fg = c.warm, bold = true }
	hl.SnacksPickerDir = { fg = c.fg_dim }
	hl.SnacksPickerFile = { fg = "#D2D7D6" }
	hl.SnacksPickerHidden = { fg = c.fg_dim }
	hl.SnacksPickerPathHidden = { fg = c.fg_dim }
	hl.SnacksPickerPathIgnored = { fg = c.fg_dim }
	hl.SnacksPickerSelected = { fg = c.fg, bg = c.bg_selection, bold = true }
	hl.SnacksPickerToggle = { fg = c.cyan }
	hl.SnacksPickerLink = { fg = c.cyan }
	hl.SnacksPickerGitStatusAdded = { fg = c.green }
	hl.SnacksPickerGitStatusModified = { fg = c.blue }
	hl.SnacksPickerGitStatusDeleted = { fg = c.red }
	hl.SnacksPickerGitStatusIgnored = { fg = c.fg_dim }
	hl.SnacksPickerGitStatusUntracked = { fg = "#B3C2A1" }

	-- Snacks Dashboard
	hl.SnacksDashboardNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg }
	hl.SnacksDashboardHeader = { fg = c.blue, bold = true }
	hl.SnacksDashboardFooter = { fg = c.fg_dark }
	hl.SnacksDashboardIcon = { fg = c.orange }
	hl.SnacksDashboardKey = { fg = c.magenta, bold = true }
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

	hl.SnacksNotifierErrorTitle = { fg = c.error, bold = true }
	hl.SnacksNotifierWarnTitle = { fg = c.warning, bold = true }
	hl.SnacksNotifierInfoTitle = { fg = c.info, bold = true }
	hl.SnacksNotifierDebugTitle = { fg = c.hint, bold = true }
	hl.SnacksNotifierTraceTitle = { fg = c.magenta, bold = true }

	hl.SnacksNotifierErrorIcon = { fg = c.error }
	hl.SnacksNotifierWarnIcon = { fg = c.warning }
	hl.SnacksNotifierInfoIcon = { fg = c.info }
	hl.SnacksNotifierDebugIcon = { fg = c.hint }
	hl.SnacksNotifierTraceIcon = { fg = c.magenta }

	return hl
end

return M
