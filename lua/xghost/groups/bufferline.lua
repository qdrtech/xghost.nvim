-- Bufferline highlight groups for xghost.nvim
-- Tab/buffer line styling with clear active/inactive distinction
local M = {}

function M.get(c, config)
	local hl = {}
	local active_bg = c.tab_active_bg
	local active_fg = c.tab_active_fg
	local inactive_bg = c.tab_inactive_bg
	local inactive_fg = c.tab_inactive_fg
	local fill_bg = c.bg_statusline_inactive

	-- Background fill for the bufferline
	hl.BufferLineFill = { bg = fill_bg }

	-- Active buffer (currently selected)
	hl.BufferLineBufferSelected = { fg = active_fg, bg = active_bg, bold = true }
	hl.BufferLineNumberSelected = { fg = active_fg, bg = active_bg, bold = true }
	hl.BufferLineCloseButtonSelected = { fg = c.red, bg = active_bg }
	hl.BufferLineModifiedSelected = { fg = c.git_change, bg = active_bg }
	hl.BufferLineIndicatorSelected = { fg = c.tab_active_border, bg = active_bg, underline = true, sp = c.tab_active_border }
	hl.BufferLineDuplicateSelected = { fg = c.fg_dark, bg = active_bg, italic = true }

	-- Visible buffer (visible but not active)
	hl.BufferLineBufferVisible = { fg = c.fg_dark, bg = inactive_bg }
	hl.BufferLineNumberVisible = { fg = c.fg_dark, bg = inactive_bg }
	hl.BufferLineCloseButtonVisible = { fg = c.fg_ghost, bg = inactive_bg }
	hl.BufferLineModifiedVisible = { fg = c.git_change, bg = inactive_bg }
	hl.BufferLineIndicatorVisible = { fg = c.fg_ghost, bg = inactive_bg }
	hl.BufferLineDuplicateVisible = { fg = c.fg_darker, bg = inactive_bg, italic = true }

	-- Inactive buffer (not visible)
	hl.BufferLineBuffer = { fg = inactive_fg, bg = inactive_bg }
	hl.BufferLineNumber = { fg = inactive_fg, bg = inactive_bg }
	hl.BufferLineCloseButton = { fg = inactive_fg, bg = inactive_bg }
	hl.BufferLineModified = { fg = c.git_change, bg = inactive_bg }
	hl.BufferLineIndicator = { fg = inactive_bg, bg = inactive_bg }
	hl.BufferLineDuplicate = { fg = c.fg_darker, bg = inactive_bg, italic = true }

	-- Separators (between buffers)
	hl.BufferLineSeparator = { fg = c.border, bg = inactive_bg }
	hl.BufferLineSeparatorVisible = { fg = c.border, bg = inactive_bg }
	hl.BufferLineSeparatorSelected = { fg = c.border, bg = active_bg }

	-- Tab indicators
	hl.BufferLineTab = { fg = inactive_fg, bg = inactive_bg }
	hl.BufferLineTabSelected = { fg = active_fg, bg = active_bg, bold = true, underline = true, sp = c.tab_active_border }
	hl.BufferLineTabClose = { fg = c.red, bg = inactive_bg }

	-- Diagnostic indicators in bufferline
	hl.BufferLineErrorDiagnostic = { fg = c.error, bg = c.bg_darker }
	hl.BufferLineErrorDiagnosticVisible = { fg = c.error, bg = c.bg_highlight }
	hl.BufferLineErrorDiagnosticSelected = { fg = c.error, bg = c.bg }

	hl.BufferLineWarningDiagnostic = { fg = c.warning, bg = c.bg_darker }
	hl.BufferLineWarningDiagnosticVisible = { fg = c.warning, bg = c.bg_highlight }
	hl.BufferLineWarningDiagnosticSelected = { fg = c.warning, bg = c.bg }

	hl.BufferLineInfoDiagnostic = { fg = c.info, bg = c.bg_darker }
	hl.BufferLineInfoDiagnosticVisible = { fg = c.info, bg = c.bg_highlight }
	hl.BufferLineInfoDiagnosticSelected = { fg = c.info, bg = c.bg }

	hl.BufferLineHintDiagnostic = { fg = c.hint, bg = c.bg_darker }
	hl.BufferLineHintDiagnosticVisible = { fg = c.hint, bg = c.bg_highlight }
	hl.BufferLineHintDiagnosticSelected = { fg = c.hint, bg = c.bg }

	-- Pick mode (buffer selection mode)
	hl.BufferLinePick = { fg = c.red, bg = c.bg_darker, bold = true }
	hl.BufferLinePickVisible = { fg = c.red, bg = c.bg_highlight, bold = true }
	hl.BufferLinePickSelected = { fg = c.red, bg = c.bg, bold = true }

	-- Offset sections (for sidebars like file explorers)
	hl.BufferLineOffsetSeparator = { fg = c.border, bg = c.bg_darker }

	return hl
end

return M
