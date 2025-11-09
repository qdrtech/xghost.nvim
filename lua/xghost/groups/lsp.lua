-- LSP and diagnostic highlight groups for xghost.nvim
local M = {}

function M.get(c, config)
	local hl = {}

	-- LSP Diagnostics
	hl.DiagnosticError = { fg = c.error }
	hl.DiagnosticWarn = { fg = c.warning }
	hl.DiagnosticInfo = { fg = c.info }
	hl.DiagnosticHint = { fg = c.hint }
	hl.DiagnosticOk = { fg = c.green }

	-- Diagnostic virtual text
	hl.DiagnosticVirtualTextError = { fg = c.error, bg = c.none }
	hl.DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.none }
	hl.DiagnosticVirtualTextInfo = { fg = c.info, bg = c.none }
	hl.DiagnosticVirtualTextHint = { fg = c.hint, bg = c.none }
	hl.DiagnosticVirtualTextOk = { fg = c.green, bg = c.none }

	-- Diagnostic underlines
	hl.DiagnosticUnderlineError = { sp = c.error, undercurl = true }
	hl.DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true }
	hl.DiagnosticUnderlineInfo = { sp = c.info, undercurl = true }
	hl.DiagnosticUnderlineHint = { sp = c.hint, undercurl = true }
	hl.DiagnosticUnderlineOk = { sp = c.green, undercurl = true }

	-- Diagnostic signs (gutter)
	hl.DiagnosticSignError = { fg = c.error, bg = config.transparent and c.none or c.bg }
	hl.DiagnosticSignWarn = { fg = c.warning, bg = config.transparent and c.none or c.bg }
	hl.DiagnosticSignInfo = { fg = c.info, bg = config.transparent and c.none or c.bg }
	hl.DiagnosticSignHint = { fg = c.hint, bg = config.transparent and c.none or c.bg }
	hl.DiagnosticSignOk = { fg = c.green, bg = config.transparent and c.none or c.bg }

	-- Diagnostic floating windows
	hl.DiagnosticFloatingError = { fg = c.error, bg = c.bg_float }
	hl.DiagnosticFloatingWarn = { fg = c.warning, bg = c.bg_float }
	hl.DiagnosticFloatingInfo = { fg = c.info, bg = c.bg_float }
	hl.DiagnosticFloatingHint = { fg = c.hint, bg = c.bg_float }
	hl.DiagnosticFloatingOk = { fg = c.green, bg = c.bg_float }

	-- LSP References
	hl.LspReferenceText = { bg = c.bg_visual }
	hl.LspReferenceRead = { bg = c.bg_visual }
	hl.LspReferenceWrite = { bg = c.bg_visual, underline = true }

	-- LSP Signature help
	hl.LspSignatureActiveParameter = { fg = c.orange, bold = true }

	-- LSP Code lens
	hl.LspCodeLens = { fg = c.subtle, italic = true }
	hl.LspCodeLensSeparator = { fg = c.fg_ghost }

	-- LSP Inlay hints
	hl.LspInlayHint = { fg = c.subtle, bg = c.bg_highlight, italic = true }

	return hl
end

return M
