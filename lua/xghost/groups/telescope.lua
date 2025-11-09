-- Telescope highlight groups for xghost.nvim
local M = {}

function M.get(c, config)
	local hl = {}

	local bg_telescope = config.darker_sidebar and c.bg_sidebar or c.bg

	-- Telescope borders
	hl.TelescopeBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopePromptBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopeResultsBorder = { fg = c.border, bg = bg_telescope }
	hl.TelescopePreviewBorder = { fg = c.border, bg = bg_telescope }

	-- Telescope titles
	hl.TelescopeTitle = { fg = c.blue, bg = bg_telescope, bold = true }
	hl.TelescopePromptTitle = { fg = c.blue, bg = bg_telescope, bold = true }
	hl.TelescopeResultsTitle = { fg = c.fg_dark, bg = bg_telescope, bold = true }
	hl.TelescopePreviewTitle = { fg = c.fg_dark, bg = bg_telescope, bold = true }

	-- Telescope normal
	hl.TelescopeNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopePromptNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopeResultsNormal = { fg = c.fg, bg = bg_telescope }
	hl.TelescopePreviewNormal = { fg = c.fg, bg = bg_telescope }

	-- Telescope selection
	hl.TelescopeSelection = { fg = c.fg, bg = c.bg_visual, bold = true }
	hl.TelescopeSelectionCaret = { fg = c.blue, bg = c.bg_visual, bold = true }
	hl.TelescopeMultiSelection = { fg = c.fg_dark, bg = c.bg_highlight }

	-- Telescope prompt
	hl.TelescopePromptPrefix = { fg = c.blue, bg = bg_telescope, bold = true }
	hl.TelescopePromptCounter = { fg = c.fg_dark, bg = bg_telescope }

	-- Telescope matching
	hl.TelescopeMatching = { fg = c.orange, bold = true }

	return hl
end

return M
