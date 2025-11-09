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

	-- Snacks Explorer (File tree)
	hl.SnacksExplorerNormal = { fg = c.fg, bg = bg }
	hl.SnacksExplorerBorder = { fg = c.border, bg = bg }
	hl.SnacksExplorerTitle = { fg = c.blue, bg = bg, bold = true }

	-- File/folder items
	hl.SnacksExplorerDir = { fg = c.blue }
	hl.SnacksExplorerFile = { fg = c.fg }
	hl.SnacksExplorerHidden = { fg = c.fg_dark }
	hl.SnacksExplorerSymlink = { fg = c.cyan }
	hl.SnacksExplorerExecutable = { fg = c.green }

	-- Git status in explorer
	hl.SnacksExplorerGitAdd = { fg = c.git_add }
	hl.SnacksExplorerGitChange = { fg = c.git_change }
	hl.SnacksExplorerGitDelete = { fg = c.git_delete }
	hl.SnacksExplorerGitIgnored = { fg = c.fg_ghost }
	hl.SnacksExplorerGitUntracked = { fg = c.fg_ghost }

	-- Icons and indent markers
	hl.SnacksExplorerIcon = { fg = c.fg_dark }
	hl.SnacksExplorerIndent = { fg = c.fg_ghost }

	-- Selection and cursor
	hl.SnacksExplorerCursor = { bg = c.bg_highlight }
	hl.SnacksExplorerSelected = { fg = c.fg, bg = c.bg_visual, bold = true }

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
