-- Git-related highlight groups for xghost.nvim
-- Supports GitSigns, vim-gitgutter, and other git plugins
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

	-- GitSigns
	hl.GitSignsAdd = { fg = c.git_add, bg = config.transparent and c.none or c.bg }
	hl.GitSignsChange = { fg = c.git_change, bg = config.transparent and c.none or c.bg }
	hl.GitSignsDelete = { fg = c.git_delete, bg = config.transparent and c.none or c.bg }
	hl.GitSignsChangedelete = { fg = c.git_change, bg = config.transparent and c.none or c.bg }
	hl.GitSignsTopdelete = { fg = c.git_delete, bg = config.transparent and c.none or c.bg }
	hl.GitSignsUntracked = { fg = c.fg_ghost, bg = config.transparent and c.none or c.bg }

	-- GitSigns line highlights
	hl.GitSignsAddLn = { bg = c.diff_add }
	hl.GitSignsChangeLn = { bg = c.diff_change }
	hl.GitSignsDeleteLn = { bg = c.diff_delete }

	-- GitSigns inline highlights
	hl.GitSignsAddInline = { bg = c.diff_add }
	hl.GitSignsChangeInline = { bg = c.diff_text }
	hl.GitSignsDeleteInline = { bg = c.diff_delete }

	-- GitSigns preview
	hl.GitSignsAddPreview = { link = "DiffAdd" }
	hl.GitSignsDeletePreview = { link = "DiffDelete" }

	-- GitSigns current line blame
	hl.GitSignsCurrentLineBlame = { fg = c.subtle, italic = true }

	-- vim-gitgutter (legacy support)
	hl.GitGutterAdd = { link = "GitSignsAdd" }
	hl.GitGutterChange = { link = "GitSignsChange" }
	hl.GitGutterDelete = { link = "GitSignsDelete" }
	hl.GitGutterChangeDelete = { link = "GitSignsChangedelete" }

	-- Neogit
	hl.NeogitBranch = { fg = c.blue }
	hl.NeogitRemote = { fg = c.magenta }
	hl.NeogitHunkHeader = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.NeogitHunkHeaderHighlight = { fg = c.fg, bg = c.bg_visual }
	hl.NeogitDiffAdd = { fg = c.git_add, bg = c.diff_add }
	hl.NeogitDiffDelete = { fg = c.git_delete, bg = c.diff_delete }
	hl.NeogitDiffContext = { fg = c.fg_dark }

	-- Diffview
	hl.DiffviewFilePanelTitle = { fg = c.blue, bold = use_bold_for("ui") }
	hl.DiffviewFilePanelCounter = { fg = c.fg_dark }
	hl.DiffviewFilePanelFileName = { fg = c.fg }
	hl.DiffviewNormal = { fg = c.fg, bg = c.bg }
	hl.DiffviewCursorLine = { bg = c.bg_highlight }
	hl.DiffviewVertSplit = { link = "VertSplit" }
	hl.DiffviewSignColumn = { link = "SignColumn" }
	hl.DiffviewStatusLine = { link = "StatusLine" }
	hl.DiffviewStatusLineNC = { link = "StatusLineNC" }
	hl.DiffviewEndOfBuffer = { link = "EndOfBuffer" }

	return hl
end

return M
