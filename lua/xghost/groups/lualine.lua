-- Lualine highlight groups for xghost.nvim
-- Statusline design from spec section 9
local M = {}

function M.get(c, config)
	local hl = {}

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

	-- Foreground color for mode chips (dark text on colored bg)
	local mode_fg = "#1E1F22"

	-- Section B/C background and foreground (from spec)
	local section_bc_bg = "#26282B"
	local section_bc_fg = "#E6E9EA"

	-- Mode-specific colors (spec section 9: mode chips)
	hl.LualineNormalMode = { fg = mode_fg, bg = c.warm, bold = use_bold_for("ui") } -- Warm accent for normal
	hl.LualineInsertMode = { fg = mode_fg, bg = c.cyan, bold = use_bold_for("ui") } -- Cyan for insert
	hl.LualineVisualMode = { fg = mode_fg, bg = c.purple, bold = use_bold_for("ui") } -- Purple for visual
	hl.LualineReplaceMode = { fg = mode_fg, bg = c.red, bold = use_bold_for("ui") } -- Red for replace
	hl.LualineCommandMode = { fg = mode_fg, bg = c.green, bold = use_bold_for("ui") } -- Green for command
	hl.LualineTerminalMode = { fg = mode_fg, bg = c.cyan, bold = use_bold_for("ui") } -- Cyan for terminal

	-- Section backgrounds
	hl.LualineSectionA = { fg = mode_fg, bg = c.warm, bold = use_bold_for("ui") } -- Mode indicator
	hl.LualineSectionB = { fg = section_bc_fg, bg = section_bc_bg } -- Filename, diagnostics
	hl.LualineSectionC = { fg = c.fg_ui, bg = c.bg_darker } -- Inactive sections
	hl.LualineSectionX = { fg = c.fg_ui, bg = c.bg_darker } -- Inactive sections
	hl.LualineSectionY = { fg = section_bc_fg, bg = section_bc_bg } -- Git, filetype
	hl.LualineSectionZ = { fg = mode_fg, bg = c.warm, bold = use_bold_for("ui") } -- Position info

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
	hl.LualineGitBranch = { fg = section_bc_fg, bg = section_bc_bg } -- In section B/Y
	hl.LualineGitAdded = { fg = c.git_add, bg = section_bc_bg }
	hl.LualineGitChanged = { fg = c.git_change, bg = section_bc_bg }
	hl.LualineGitDeleted = { fg = c.git_delete, bg = section_bc_bg }

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
