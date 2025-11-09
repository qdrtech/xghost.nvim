-- Warm xghost color palette
-- Calm, low-contrast dark UI with warm accents (from warm design spec)
-- Based on warm-theme-design-spec.md
local M = {}

-- Base colors
M.none = "NONE"
M.bg = "#2C2D30" -- Main editor background (bg.editor)
M.bg_darker = "#212325" -- Darker for statusline
M.bg_sidebar = "#242628" -- Sidebar, signcolumn, gutters
M.bg_float = "#2E3033" -- Popups, LSP hover, completion menu
M.bg_highlight = "#323438" -- Cursor line highlight
M.bg_visual = "#3A3D41" -- Visual selection
M.bg_search = "#373C42" -- Search highlight background
M.bg_selection = "#34373B" -- Used for sidebar selections and virtual text patches
M.bg_pmenu = "#2F3236" -- Completion menu background
M.bg_pmenu_sel = "#3A3E43" -- Completion menu selection row
M.bg_statusline_inactive = "#2A2C2E" -- Inactive statusline/tabline bg
M.tab_active_bg = "#303337"
M.tab_inactive_bg = "#26282A"
M.sidebar_text = "#D2D7D6"
M.sidebar_muted = "#9CA9A5"
M.folder_closed = "#CFB08A"

-- Foreground colors
M.fg = "#FAFAFB" -- Primary text (fg.default)
M.fg_dim = "#9CA9A5" -- Comments, guides, muted UI
M.fg_ui = "#BFC7C4" -- Gutter text, inactive elements
M.fg_dark = "#9CA9A5" -- Alias for dim
M.fg_darker = "#848E8B" -- Even dimmer
M.fg_ghost = "#5A5F64" -- Very dim/ghosted text
M.tab_active_fg = "#EAECEE"
M.tab_inactive_fg = "#A9B2B0"
M.tab_active_border = "#E19C60"
M.clock_text = "#C9D0CE" -- Statusline clock chip text

-- Border and UI elements
M.border = "#3A3C3F" -- Subtle borders, splits
M.border_highlight = "#3E4145" -- Highlighted borders
M.scrollbar_track = "#3B3E42"
M.scrollbar_thumb = "#5A5F64"
M.indent_guide = "#44474B"

-- Comments
M.comment = "#9CA9A5" -- fg.dim - muted gray/teal
M.subtle = "#848E8B" -- Even more subtle

-- Warm accent (primary UI accent)
M.warm = "#E19C60" -- Line numbers, titles, folder highlights
M.warm_bright = "#F2BF8A" -- Brighter warm for current line number

-- Accent colors (syntax)
M.cyan = "#47A8D4" -- Identifiers, links, info (accent.cyan)
M.blue = "#61AFEF" -- Functions, methods (accent.blue)
M.purple = "#C678DD" -- Keywords, types (accent.purple)
M.magenta = "#C678DD" -- Alias for purple
M.green = "#7AC17A" -- Git added, success (accent.green)
M.yellow = "#E5C07B" -- Warnings, constants (accent.yellow)
M.orange = "#D19A66" -- Numbers, enums (accent.orange)
M.red = "#E06C75" -- Errors, deletions (accent.red)
M.white = "#FAFAFB" -- Pure white (same as fg)

-- Special syntax colors
M.string = "#A0D9AA" -- Soft green for strings (from spec)
M.operator = "#C0C6C4" -- Subtle for operators
M.special = "#D7DEE0" -- For special characters

-- Muted variants (for compatibility)
M.blue_muted = M.blue
M.cyan_muted = M.cyan
M.green_muted = M.string -- Strings use soft green
M.yellow_muted = M.yellow
M.orange_muted = M.orange
M.red_muted = M.red
M.magenta_muted = M.purple

-- Git colors (using macOS system colors)
M.git_add = M.green
M.git_change = M.blue
M.git_delete = M.red
M.git_text = M.cyan
M.git_untracked = "#B3C2A1"

-- Diagnostic colors
M.error = M.red
M.warning = M.yellow
M.info = M.blue
M.hint = M.cyan
M.virtual_text_bg = "#34373B"

-- Diff colors (from spec section 10)
M.diff_add = "#233026" -- Dark green background
M.diff_add_fg = "#B9E0B7" -- Light green text
M.diff_delete = "#3A2627" -- Dark red background
M.diff_delete_fg = "#F2B5B9" -- Light red text
M.diff_change = "#24303A" -- Dark blue background
M.diff_change_fg = "#BFD8F2" -- Light blue text
M.diff_text = "#24303A" -- Highlighted change (same as change)

return M
