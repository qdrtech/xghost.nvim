-- Default xghost color palette
-- Vibrant, warm theme with rich colors
local M = {}

-- Base colors - dark charcoal background with warm accents
M.none = "NONE"
M.bg = "#282c34" -- Dark charcoal background
M.bg_darker = "#21252b" -- Darker variant for sidebars
M.bg_highlight = "#2c323c" -- Selection/highlight background
M.bg_visual = "#3e4451" -- Visual mode selection
M.bg_float = "#282c34" -- Floating window background
M.bg_sidebar = "#21252b" -- Sidebar background (darker)

M.fg = "#abb2bf" -- Primary text (light gray)
M.fg_dark = "#5c6370" -- Secondary text (medium gray)
M.fg_darker = "#4b5263" -- Tertiary text (darker gray)
M.fg_ghost = "#3e4451" -- Ghosted/inactive text

-- Border and UI elements
M.border = "#3e4451" -- Subtle borders
M.border_highlight = "#4b5263" -- Highlighted borders

-- Comments - muted teal/gray
M.comment = "#5c6370" -- Muted gray for comments
M.subtle = "#5c6370" -- Subtle elements

-- Vibrant accent colors
M.blue = "#61afef" -- Bright blue (functions, types)
M.cyan = "#56b6c2" -- Bright cyan (strings, constants)
M.green = "#98c379" -- Bright green (success, strings)
M.yellow = "#e5c07b" -- Golden yellow (classes, warnings)
M.orange = "#d19a66" -- Warm orange (numbers, constants)
M.red = "#e06c75" -- Soft red (errors, keywords)
M.magenta = "#c678dd" -- Vibrant purple (keywords, operators)
M.white = "#ffffff" -- Pure white

-- Syntax colors (using vibrant palette)
M.blue_muted = "#61afef"
M.cyan_muted = "#56b6c2"
M.green_muted = "#98c379"
M.yellow_muted = "#e5c07b"
M.orange_muted = "#d19a66"
M.red_muted = "#e06c75"
M.magenta_muted = "#c678dd"

-- Git colors (using macOS system colors)
M.git_add = M.green
M.git_change = M.yellow
M.git_delete = M.red
M.git_text = M.blue

-- Diagnostic colors
M.error = M.red
M.warning = M.yellow
M.info = M.blue
M.hint = M.cyan

-- Diff colors
M.diff_add = "#2c3a2e" -- Dark green background
M.diff_delete = "#3c2c2e" -- Dark red background
M.diff_change = "#3a372c" -- Dark yellow background
M.diff_text = "#4a4428" -- Highlighted change

return M
