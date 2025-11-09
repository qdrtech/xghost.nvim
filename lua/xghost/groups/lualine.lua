-- Lualine highlight groups for xghost.nvim
-- Statusline with segmented design matching the reference aesthetic
local M = {}

function M.get(c, config)
	local hl = {}

	-- Mode-specific colors (prominent, colored backgrounds)
	-- These create the segmented look with colored mode indicators
	hl.LualineNormalMode = { fg = c.bg, bg = c.green, bold = true }
	hl.LualineInsertMode = { fg = c.bg, bg = c.blue, bold = true }
	hl.LualineVisualMode = { fg = c.bg, bg = c.magenta, bold = true }
	hl.LualineReplaceMode = { fg = c.bg, bg = c.red, bold = true }
	hl.LualineCommandMode = { fg = c.bg, bg = c.yellow, bold = true }
	hl.LualineTerminalMode = { fg = c.bg, bg = c.cyan, bold = true }

	-- Section backgrounds (subtle, muted backgrounds for different sections)
	hl.LualineSectionA = { fg = c.bg, bg = c.green, bold = true }
	hl.LualineSectionB = { fg = c.fg, bg = c.bg_highlight }
	hl.LualineSectionC = { fg = c.fg_dark, bg = c.bg }
	hl.LualineSectionX = { fg = c.fg_dark, bg = c.bg }
	hl.LualineSectionY = { fg = c.fg, bg = c.bg_highlight }
	hl.LualineSectionZ = { fg = c.bg, bg = c.green, bold = true }

	-- Inactive statusline (dimmed)
	hl.LualineInactiveNormal = { fg = c.fg_ghost, bg = c.bg }
	hl.LualineInactiveSectionA = { fg = c.fg_ghost, bg = c.bg }
	hl.LualineInactiveSectionB = { fg = c.fg_ghost, bg = c.bg }
	hl.LualineInactiveSectionC = { fg = c.fg_ghost, bg = c.bg }

	-- File info and diagnostics
	hl.LualineFilename = { fg = c.fg, bg = c.bg_highlight }
	hl.LualineFiletype = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.LualineFileformat = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.LualineEncoding = { fg = c.fg_dark, bg = c.bg_highlight }

	-- Git status (colored indicators)
	hl.LualineGitBranch = { fg = c.bg, bg = c.green, bold = true }
	hl.LualineGitAdded = { fg = c.git_add, bg = c.bg_highlight }
	hl.LualineGitChanged = { fg = c.git_change, bg = c.bg_highlight }
	hl.LualineGitDeleted = { fg = c.git_delete, bg = c.bg_highlight }

	-- LSP and diagnostics
	hl.LualineDiagnosticError = { fg = c.error, bg = c.bg_highlight }
	hl.LualineDiagnosticWarn = { fg = c.warning, bg = c.bg_highlight }
	hl.LualineDiagnosticInfo = { fg = c.info, bg = c.bg_highlight }
	hl.LualineDiagnosticHint = { fg = c.hint, bg = c.bg_highlight }

	-- Progress indicators
	hl.LualineProgress = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.LualineLocation = { fg = c.fg, bg = c.bg_highlight }

	-- Special components
	hl.LualineDiff = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.LualineBuffer = { fg = c.fg, bg = c.bg_highlight }

	-- Transitional backgrounds (for smooth gradient effect)
	hl.LualineTransitionA = { fg = c.green, bg = c.bg_highlight }
	hl.LualineTransitionB = { fg = c.bg_highlight, bg = c.bg }
	hl.LualineTransitionC = { fg = c.bg, bg = c.bg_highlight }

	return hl
end

return M
