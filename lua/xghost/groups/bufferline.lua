-- Bufferline highlight groups for xghost.nvim
-- Tab/buffer line styling with clear active/inactive distinction
local M = {}

function M.get(c, config)
	local hl = {}

	-- Background fill for the bufferline
	hl.BufferLineFill = { bg = c.bg_darker }

	-- Active buffer (currently selected)
	hl.BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true, italic = false }
	hl.BufferLineNumberSelected = { fg = c.fg, bg = c.bg, bold = true }
	hl.BufferLineCloseButtonSelected = { fg = c.red, bg = c.bg }
	hl.BufferLineModifiedSelected = { fg = c.git_change, bg = c.bg }
	hl.BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg }
	hl.BufferLineDuplicateSelected = { fg = c.fg_dark, bg = c.bg, italic = true }

	-- Visible buffer (visible but not active)
	hl.BufferLineBufferVisible = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.BufferLineNumberVisible = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.BufferLineCloseButtonVisible = { fg = c.fg_ghost, bg = c.bg_highlight }
	hl.BufferLineModifiedVisible = { fg = c.git_change, bg = c.bg_highlight }
	hl.BufferLineIndicatorVisible = { fg = c.fg_ghost, bg = c.bg_highlight }
	hl.BufferLineDuplicateVisible = { fg = c.fg_darker, bg = c.bg_highlight, italic = true }

	-- Inactive buffer (not visible)
	hl.BufferLineBuffer = { fg = c.fg_ghost, bg = c.bg_darker }
	hl.BufferLineNumber = { fg = c.fg_ghost, bg = c.bg_darker }
	hl.BufferLineCloseButton = { fg = c.fg_ghost, bg = c.bg_darker }
	hl.BufferLineModified = { fg = c.git_change, bg = c.bg_darker }
	hl.BufferLineIndicator = { fg = c.bg_darker, bg = c.bg_darker }
	hl.BufferLineDuplicate = { fg = c.fg_darker, bg = c.bg_darker, italic = true }

	-- Separators (between buffers)
	hl.BufferLineSeparator = { fg = c.bg_darker, bg = c.bg_darker }
	hl.BufferLineSeparatorVisible = { fg = c.bg_highlight, bg = c.bg_highlight }
	hl.BufferLineSeparatorSelected = { fg = c.bg, bg = c.bg }

	-- Tab indicators
	hl.BufferLineTab = { fg = c.fg_ghost, bg = c.bg_darker }
	hl.BufferLineTabSelected = { fg = c.fg, bg = c.bg, bold = true }
	hl.BufferLineTabClose = { fg = c.red, bg = c.bg_darker }

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
