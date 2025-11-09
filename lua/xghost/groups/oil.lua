-- Oil.nvim highlight groups for xghost.nvim
-- File management plugin that edits directories like buffers
local M = {}

function M.get(c, config)
	local hl = {}

	-- Main oil window
	hl.OilNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg }
	hl.OilFloat = { fg = c.fg, bg = c.bg_float }
	hl.OilBorder = { fg = c.border, bg = c.bg_float }
	hl.OilTitle = { fg = c.blue, bg = c.bg_float, bold = true }

	-- Directory entries
	hl.OilDir = { fg = c.blue, bold = true }
	hl.OilDirIcon = { fg = c.blue }
	hl.OilLink = { fg = c.cyan }
	hl.OilLinkTarget = { fg = c.cyan, italic = true }
	hl.OilSocket = { fg = c.magenta }
	hl.OilFifo = { fg = c.yellow }

	-- File types and permissions
	hl.OilFile = { fg = c.fg }
	hl.OilHidden = { fg = c.fg_dark }
	hl.OilExecutable = { fg = c.green }
	hl.OilPermissionNone = { fg = c.fg_ghost }
	hl.OilPermissionRead = { fg = c.yellow }
	hl.OilPermissionWrite = { fg = c.orange }
	hl.OilPermissionExecute = { fg = c.green }

	-- File size and timestamps
	hl.OilSize = { fg = c.fg_dark }
	hl.OilMtime = { fg = c.fg_dark }

	-- Selection and cursor
	hl.OilCursor = { bg = c.bg_highlight }
	hl.OilCursorLine = { bg = c.bg_highlight }

	-- Special entries
	hl.OilTrash = { fg = c.red, italic = true }
	hl.OilTrashDir = { fg = c.red, bold = true, italic = true }
	hl.OilCreate = { fg = c.green, bold = true }
	hl.OilDelete = { fg = c.red, bold = true }
	hl.OilMove = { fg = c.yellow, bold = true }
	hl.OilCopy = { fg = c.blue, bold = true }
	hl.OilChange = { fg = c.orange, bold = true }

	-- Column headers
	hl.OilHeader = { fg = c.fg_dark, bold = true }

	return hl
end

return M
