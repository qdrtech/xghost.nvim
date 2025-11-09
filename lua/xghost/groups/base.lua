-- Base Vim highlight groups for xghost.nvim
local M = {}

function M.get(c, config)
	local hl = {}

	-- Editor
	hl.Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }
	hl.NormalFloat = { fg = c.fg, bg = c.bg_float }
	hl.FloatBorder = { fg = c.border_highlight, bg = c.bg_float }
	hl.FloatTitle = { fg = c.blue, bg = c.bg_float, bold = true }

	-- Line numbers and columns (spec section 6)
	hl.LineNr = { fg = c.warm } -- Warm accent for line numbers
	hl.CursorLineNr = { fg = c.warm_bright, bold = true } -- Brighter warm for current line
	hl.CursorLine = { bg = c.bg_highlight }
	hl.CursorColumn = { bg = c.bg_highlight }
	hl.ColorColumn = { bg = "#3A3C40" } -- From spec
	hl.SignColumn = { fg = c.fg_ui, bg = config.transparent and c.none or c.bg_sidebar }

	-- Cursor
	hl.Cursor = { fg = c.bg, bg = c.fg }
	hl.lCursor = { fg = c.bg, bg = c.fg }
	hl.CursorIM = { fg = c.bg, bg = c.fg }
	hl.TermCursor = { fg = c.bg, bg = c.fg }
	hl.TermCursorNC = { fg = c.bg, bg = c.fg_dark }

	-- Selection and visual mode
	hl.Visual = { bg = c.bg_visual }
	hl.VisualNOS = { bg = c.bg_visual }

	-- Search (spec section 4)
	hl.Search = { bg = c.bg_search, underline = true, sp = c.yellow } -- Subtle with underline
	hl.IncSearch = { bg = "#41454A", underline = true, sp = c.cyan } -- Lighter bg, cyan underline
	hl.CurSearch = { bg = "#41454A", underline = true, sp = c.yellow } -- Current match
	hl.Substitute = { fg = c.bg, bg = c.red }

	-- Statusline
	hl.StatusLine = { fg = c.fg_ui, bg = c.bg_darker }
	hl.StatusLineNC = { fg = c.fg_ui, bg = c.bg_statusline_inactive }
	hl.WinBar = { fg = c.fg_dark, bg = c.none }
	hl.WinBarNC = { fg = c.fg_ghost, bg = c.none }

	-- Tabline
	hl.TabLine = { fg = c.tab_inactive_fg, bg = c.tab_inactive_bg }
	hl.TabLineFill = { bg = c.bg }
	hl.TabLineSel = {
		fg = c.tab_active_fg,
		bg = c.tab_active_bg,
		bold = true,
		underline = true,
		sp = c.tab_active_border,
	}

	-- Messages and command line
	hl.MsgArea = { fg = c.fg }
	hl.ModeMsg = { fg = c.fg_dark, bold = true }
	hl.MoreMsg = { fg = c.green }
	hl.WarningMsg = { fg = c.warning }
	hl.ErrorMsg = { fg = c.error }
	hl.Question = { fg = c.blue }

	-- Popup menu (completion)
	hl.Pmenu = { fg = "#E8EBEC", bg = c.bg_pmenu }
	hl.PmenuSel = { fg = c.fg, bg = c.bg_pmenu_sel, bold = true, underline = true, sp = c.cyan }
	hl.PmenuSbar = { bg = c.scrollbar_track }
	hl.PmenuThumb = { bg = c.scrollbar_thumb }
	hl.WildMenu = { fg = c.fg, bg = c.bg_visual }

	-- Diffs (spec section 10)
	hl.DiffAdd = { fg = c.diff_add_fg, bg = c.diff_add }
	hl.DiffDelete = { fg = c.diff_delete_fg, bg = c.diff_delete }
	hl.DiffChange = { fg = c.diff_change_fg, bg = c.diff_change }
	hl.DiffText = { bg = c.diff_text }

	-- Folds
	hl.Folded = { fg = c.fg_dark, bg = config.transparent and c.none or c.bg_sidebar }
	hl.FoldColumn = { fg = c.fg_ghost, bg = config.transparent and c.none or c.bg_sidebar }

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
	hl.SpecialKey = { fg = c.indent_guide }
	hl.NonText = { fg = c.indent_guide }
	hl.Whitespace = { fg = c.indent_guide }
	hl.EndOfBuffer = { fg = c.bg }

	-- Conceal
	hl.Conceal = { fg = c.subtle }

	-- Match parentheses (spec section 4: underline + accent.cyan)
	hl.MatchParen = { fg = c.cyan, underline = true }

	-- Titles and special text
	hl.Title = { fg = c.blue, bold = true }
	hl.Bold = { bold = true }
	hl.Italic = { italic = true }
	hl.Underlined = { underline = true }

	-- Syntax groups (spec section 5)
	hl.Comment = { fg = c.comment, italic = config.italic_comments } -- fg.dim with italic

	-- Constants
	hl.Constant = { fg = c.orange } -- accent.orange
	hl.String = { fg = c.string } -- #A0D9AA soft green
	hl.Character = { fg = c.string } -- Same as String
	hl.Number = { fg = c.orange } -- accent.orange
	hl.Boolean = { fg = c.orange } -- accent.orange
	hl.Float = { fg = c.orange } -- accent.orange

	-- Identifiers
	hl.Identifier = { fg = c.cyan } -- accent.cyan for identifiers
	hl.Function = { fg = c.blue } -- accent.blue for functions

	-- Statements & Keywords (semibold per spec)
	hl.Statement = { fg = c.purple, bold = true } -- accent.purple, semibold
	hl.Conditional = { fg = c.purple, bold = true } -- semibold
	hl.Repeat = { fg = c.purple, bold = true } -- semibold
	hl.Label = { fg = c.purple }
	hl.Operator = { fg = c.operator } -- #C0C6C4 subtle
	hl.Keyword = { fg = c.purple, bold = true } -- semibold (not italic)
	hl.Exception = { fg = c.red }

	-- PreProc
	hl.PreProc = { fg = c.purple } -- accent.purple
	hl.Include = { fg = c.purple }
	hl.Define = { fg = c.purple }
	hl.Macro = { fg = c.purple }
	hl.PreCondit = { fg = c.purple }

	-- Types
	hl.Type = { fg = c.yellow } -- accent.yellow
	hl.StorageClass = { fg = c.purple }
	hl.Structure = { fg = c.yellow }
	hl.Typedef = { fg = c.yellow }

	-- Special
	hl.Special = { fg = c.special } -- #D7DEE0
	hl.SpecialChar = { fg = c.orange }
	hl.Tag = { fg = c.blue }
	hl.Delimiter = { fg = c.fg_dark }
	hl.SpecialComment = { fg = c.subtle }
	hl.Debug = { fg = c.red }

	-- Errors and Todos (spec section 5)
	hl.Error = { fg = c.error, bold = true } -- Bold per spec
	hl.Todo = { fg = c.yellow, bg = "#3B3426", bold = true } -- Yellow on dark bg

	return hl
end

return M
