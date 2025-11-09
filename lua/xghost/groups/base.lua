-- Base Vim highlight groups for xghost.nvim
local M = {}

function M.get(c, config)
	local hl = {}

	-- Editor
	hl.Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }
	hl.NormalFloat = { fg = c.fg, bg = c.bg_float }
	hl.FloatBorder = { fg = c.border, bg = c.bg_float }
	hl.FloatTitle = { fg = c.blue, bg = c.bg_float, bold = true }

	-- Line numbers and columns
	hl.LineNr = { fg = c.fg_ghost }
	hl.CursorLineNr = { fg = c.fg_dark, bold = true }
	hl.CursorLine = { bg = c.bg_highlight }
	hl.CursorColumn = { bg = c.bg_highlight }
	hl.ColorColumn = { bg = c.bg_highlight }
	hl.SignColumn = { fg = c.fg_ghost, bg = config.transparent and c.none or c.bg }

	-- Cursor
	hl.Cursor = { fg = c.bg, bg = c.fg }
	hl.lCursor = { fg = c.bg, bg = c.fg }
	hl.CursorIM = { fg = c.bg, bg = c.fg }
	hl.TermCursor = { fg = c.bg, bg = c.fg }
	hl.TermCursorNC = { fg = c.bg, bg = c.fg_dark }

	-- Selection and visual mode
	hl.Visual = { bg = c.bg_visual }
	hl.VisualNOS = { bg = c.bg_visual }

	-- Search
	hl.Search = { fg = c.bg, bg = c.yellow }
	hl.IncSearch = { fg = c.bg, bg = c.orange }
	hl.CurSearch = { fg = c.bg, bg = c.orange }
	hl.Substitute = { fg = c.bg, bg = c.red }

	-- Statusline
	hl.StatusLine = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.StatusLineNC = { fg = c.fg_ghost, bg = c.bg }
	hl.WinBar = { fg = c.fg_dark, bg = c.none }
	hl.WinBarNC = { fg = c.fg_ghost, bg = c.none }

	-- Tabline
	hl.TabLine = { fg = c.fg_ghost, bg = c.bg_highlight }
	hl.TabLineFill = { bg = c.bg }
	hl.TabLineSel = { fg = c.fg, bg = c.bg_visual, bold = true }

	-- Messages and command line
	hl.MsgArea = { fg = c.fg }
	hl.ModeMsg = { fg = c.fg_dark, bold = true }
	hl.MoreMsg = { fg = c.green }
	hl.WarningMsg = { fg = c.warning }
	hl.ErrorMsg = { fg = c.error }
	hl.Question = { fg = c.blue }

	-- Popup menu (completion)
	hl.Pmenu = { fg = c.fg, bg = c.bg_highlight }
	hl.PmenuSel = { fg = c.fg, bg = c.bg_visual, bold = true }
	hl.PmenuSbar = { bg = c.bg_highlight }
	hl.PmenuThumb = { bg = c.fg_ghost }
	hl.WildMenu = { fg = c.fg, bg = c.bg_visual }

	-- Diffs
	hl.DiffAdd = { bg = c.diff_add }
	hl.DiffDelete = { bg = c.diff_delete }
	hl.DiffChange = { bg = c.diff_change }
	hl.DiffText = { bg = c.diff_text }

	-- Folds
	hl.Folded = { fg = c.fg_dark, bg = c.bg_highlight }
	hl.FoldColumn = { fg = c.fg_ghost, bg = config.transparent and c.none or c.bg }

	-- Spell checking
	hl.SpellBad = { sp = c.error, undercurl = true }
	hl.SpellCap = { sp = c.warning, undercurl = true }
	hl.SpellLocal = { sp = c.info, undercurl = true }
	hl.SpellRare = { sp = c.hint, undercurl = true }

	-- Window separators
	hl.VertSplit = { fg = c.border }
	hl.WinSeparator = { fg = c.border }

	-- Directory
	hl.Directory = { fg = c.blue }

	-- Special keys and whitespace
	hl.SpecialKey = { fg = c.fg_ghost }
	hl.NonText = { fg = c.fg_ghost }
	hl.Whitespace = { fg = c.fg_ghost }
	hl.EndOfBuffer = { fg = c.bg }

	-- Conceal
	hl.Conceal = { fg = c.subtle }

	-- Match parentheses
	hl.MatchParen = { fg = c.orange, bold = true }

	-- Titles and special text
	hl.Title = { fg = c.blue, bold = true }
	hl.Bold = { bold = true }
	hl.Italic = { italic = true }
	hl.Underlined = { underline = true }

	-- Syntax groups (fallback for non-Treesitter)
	hl.Comment = { fg = c.comment, italic = config.italic_comments }

	hl.Constant = { fg = c.orange_muted }
	hl.String = { fg = c.green_muted }
	hl.Character = { fg = c.green_muted }
	hl.Number = { fg = c.orange_muted }
	hl.Boolean = { fg = c.orange_muted }
	hl.Float = { fg = c.orange_muted }

	hl.Identifier = { fg = c.fg }
	hl.Function = { fg = c.blue_muted }

	hl.Statement = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl.Conditional = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl.Repeat = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl.Label = { fg = c.magenta_muted }
	hl.Operator = { fg = c.fg_dark }
	hl.Keyword = { fg = c.magenta_muted, italic = config.italic_keywords }
	hl.Exception = { fg = c.red_muted }

	hl.PreProc = { fg = c.magenta_muted }
	hl.Include = { fg = c.magenta_muted }
	hl.Define = { fg = c.magenta_muted }
	hl.Macro = { fg = c.magenta_muted }
	hl.PreCondit = { fg = c.magenta_muted }

	hl.Type = { fg = c.yellow_muted }
	hl.StorageClass = { fg = c.magenta_muted }
	hl.Structure = { fg = c.yellow_muted }
	hl.Typedef = { fg = c.yellow_muted }

	hl.Special = { fg = c.blue_muted }
	hl.SpecialChar = { fg = c.orange_muted }
	hl.Tag = { fg = c.blue_muted }
	hl.Delimiter = { fg = c.fg_dark }
	hl.SpecialComment = { fg = c.subtle }
	hl.Debug = { fg = c.red_muted }

	hl.Error = { fg = c.error }
	hl.Todo = { fg = c.bg, bg = c.yellow, bold = true }

	return hl
end

return M
