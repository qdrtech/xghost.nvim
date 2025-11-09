-- Default xghost color palette
-- Vibrant midnight palette with cooler accents (new default style)
local M = {}

-- Base colors
M.none = "NONE"
M.bg = "#1E1F26" -- Main editor background
M.bg_darker = "#16171D" -- Darker for statusline
M.bg_sidebar = "#191A22" -- Sidebar, signcolumn, gutters
M.bg_float = "#20212A" -- Popups, LSP hover, completion menu
M.bg_highlight = "#2A2C37" -- Cursor line highlight
M.bg_visual = "#343849" -- Visual selection
M.bg_search = "#3C3F55" -- Search highlight background
M.bg_selection = "#2B2E3F" -- Sidebar selections, virtual text patches
M.bg_pmenu = "#242635" -- Completion menu background
M.bg_pmenu_sel = "#343652" -- Completion menu selection row
M.bg_statusline_inactive = "#1A1B24" -- Inactive statusline/tabline bg
M.tab_active_bg = "#2D3041"
M.tab_inactive_bg = "#1F202A"
M.sidebar_text = "#D9DBF2"
M.sidebar_muted = "#9AA1BF"
M.folder_closed = "#F7C59F"

-- Foreground colors
M.fg = "#F4F4F8" -- Primary text
M.fg_dim = "#9FA6C1" -- Comments, guides, muted UI
M.fg_ui = "#B3BAD5" -- Gutter text, inactive elements
M.fg_dark = "#9FA6C1"
M.fg_darker = "#7B8099"
M.fg_ghost = "#5A5F77"
M.tab_active_fg = "#E8ECFF"
M.tab_inactive_fg = "#9DA3BE"
M.tab_active_border = "#63E6BE"
M.clock_text = "#C7CCE0"

-- Border and UI elements
M.border = "#2F3140"
M.border_highlight = "#3C3F52"
M.scrollbar_track = "#2B2D3A"
M.scrollbar_thumb = "#4A4E63"
M.indent_guide = "#3A3D50"

-- Comments
M.comment = "#9FA6C1"
M.subtle = "#7B8099"

-- Warm accent (still used for numbers/titles)
M.warm = "#F5A97F"
M.warm_bright = "#FFD8A8"

-- Accent colors (syntax)
M.cyan = "#7DCFFF"
M.blue = "#82AAFF"
M.purple = "#C099FF"
M.magenta = "#C099FF"
M.green = "#A8E07C"
M.yellow = "#FFE08A"
M.orange = "#F2B482"
M.red = "#FF6B81"
M.white = "#F4F4F8"

-- Special syntax colors
M.string = "#9FE8C6"
M.operator = "#C0C4DD"
M.special = "#E0E3FF"

-- Muted variants (for compatibility)
M.blue_muted = M.blue
M.cyan_muted = M.cyan
M.green_muted = M.green
M.yellow_muted = M.yellow
M.orange_muted = M.orange
M.red_muted = M.red
M.magenta_muted = M.purple

-- Git colors
M.git_add = "#81D18B"
M.git_change = "#73B9FF"
M.git_delete = "#FF7A93"
M.git_text = "#7DCFFF"
M.git_untracked = "#A8CDB2"

-- Diagnostic colors
M.error = M.red
M.warning = M.yellow
M.info = M.blue
M.hint = M.cyan
M.virtual_text_bg = "#2A2D3C"

-- Diff colors
M.diff_add = "#22352D"
M.diff_add_fg = "#B4F2C5"
M.diff_delete = "#3B262B"
M.diff_delete_fg = "#FFB2C0"
M.diff_change = "#232F40"
M.diff_change_fg = "#B7D8FF"
M.diff_text = "#2C3C52"

return M
