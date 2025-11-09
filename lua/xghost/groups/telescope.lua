-- Telescope highlight groups for xghost.nvim
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

	local bg_telescope = config.darker_sidebar and c.bg_sidebar or c.bg

	-- Telescope borders
	hl.TelescopeBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopePromptBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopeResultsBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopePreviewBorder = { fg = c.border, bg = bg_telescope }

	-- Telescope titles
	hl.TelescopeTitle = { fg = c.blue, bg = bg_telescope, bold = use_bold_for("ui") }
	hl.TelescopePromptTitle = { fg = c.blue, bg = bg_telescope, bold = use_bold_for("ui") }
	hl.TelescopeResultsTitle = { fg = c.fg_dark, bg = bg_telescope, bold = use_bold_for("ui") }
	hl.TelescopePreviewTitle = { fg = c.fg_dark, bg = bg_telescope, bold = use_bold_for("ui") }

	-- Telescope normal
	hl.TelescopeNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopePromptNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopeResultsNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopePreviewNormal = { fg = c.fg, bg = bg_telescope }

	-- Telescope selection
	hl.TelescopeSelection = { fg = c.fg, bg = c.bg_visual, bold = use_bold_for("ui") }
	hl.TelescopeSelectionCaret = { fg = c.blue, bg = c.bg_visual, bold = use_bold_for("ui") }
	hl.TelescopeMultiSelection = { fg = c.fg_dark, bg = c.bg_highlight }

	-- Telescope prompt
	hl.TelescopePromptPrefix = { fg = c.blue, bg = bg_telescope, bold = use_bold_for("ui") }
	hl.TelescopePromptCounter = { fg = c.fg_dark, bg = bg_telescope }

	-- Telescope matching
	hl.TelescopeMatching = { fg = c.orange, bold = use_bold_for("ui") }

	return hl
end

return M
