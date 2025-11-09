-- Color palette loader for xghost.nvim
local M = {}

-- Available color palettes
local palettes = {
	default = "xghost.colors.default",
	-- Future styles (commented out for now):
	-- dark = "xghost.colors.dark",
	-- light = "xghost.colors.light",
	-- warm = "xghost.colors.warm",
}

-- Load color palette based on style
function M.load(style)
	style = style or "default"

	-- Check if style exists
	if not palettes[style] then
		vim.notify(
			string.format("xghost.nvim: Style '%s' not found, using 'default'", style),
			vim.log.levels.WARN
		)
		style = "default"
	end

	-- Load the color palette module
	local ok, colors = pcall(require, palettes[style])
	if not ok then
		vim.notify(
			string.format("xghost.nvim: Failed to load style '%s'", style),
			vim.log.levels.ERROR
		)
		return require("xghost.colors.default")
	end

	return colors
end

-- Get list of available styles
function M.get_styles()
	local styles = {}
	for style, _ in pairs(palettes) do
		table.insert(styles, style)
	end
	table.sort(styles)
	return styles
end

return M
