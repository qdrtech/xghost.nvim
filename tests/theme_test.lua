-- Test suite for xghost.nvim theme
-- Verifies that highlight groups are properly defined and match expected styling

local M = {}

local function load_theme(style)
	require("xghost").setup({ style = style })
	require("xghost").load()
end

local function to_hex(value)
	if type(value) ~= "number" then
		return value
	end
	return string.format("#%06X", value)
end

local function normalize_attr(attr, value)
	if value == nil then
		return value
	end

	if attr == "fg" or attr == "bg" or attr == "sp" then
		if type(value) == "string" and value:sub(1, 1) == "#" then
			return value:upper()
		end
		return to_hex(value)
	end

	return value
end

-- Helper function to check if a highlight group is defined
local function check_hl_group(group_name, expected_attrs)
	local hl = vim.api.nvim_get_hl(0, { name = group_name })

	if not hl or vim.tbl_isempty(hl) then
		return false, string.format("Highlight group '%s' is not defined", group_name)
	end

	-- Check expected attributes if provided
	if expected_attrs then
		for attr, expected_value in pairs(expected_attrs) do
			local actual = normalize_attr(attr, hl[attr])
			local expected = normalize_attr(attr, expected_value)
			if actual ~= expected then
				return false, string.format(
					"Highlight group '%s' attr '%s' = %s, expected %s",
					group_name,
					attr,
					tostring(actual),
					tostring(expected)
				)
			end
		end
	end

	return true, nil
end

-- Test that core highlight groups exist
function M.test_core_highlights()
	local core_groups = {
		"Normal",
		"Comment",
		"Constant",
		"String",
		"Function",
		"Keyword",
		"Type",
		"Error",
		"WarningMsg",
	}

	local errors = {}
	for _, group in ipairs(core_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Core highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All core highlights defined"
end

-- Test bufferline highlights
function M.test_bufferline_highlights()
	local bufferline_groups = {
		"BufferLineFill",
		"BufferLineBufferSelected",
		"BufferLineBufferVisible",
		"BufferLineIndicatorSelected",
	}

	local errors = {}
	for _, group in ipairs(bufferline_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Bufferline highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All bufferline highlights defined"
end

-- Test lualine highlights
function M.test_lualine_highlights()
	local lualine_groups = {
		"LualineNormalMode",
		"LualineSectionA",
		"LualineSectionB",
		"LualineSectionC",
		"LualineGitBranch",
	}

	local errors = {}
	for _, group in ipairs(lualine_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Lualine highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All lualine highlights defined"
end

-- Test snacks highlights
function M.test_snacks_highlights()
	local snacks_groups = {
		"SnacksExplorerNormal",
		"SnacksExplorerDir",
		"SnacksExplorerFile",
		"SnacksExplorerGitAdd",
		"SnacksExplorerGitChange",
		"SnacksPickerTree",
		"SnacksPickerDirectory",
		"SnacksPickerFile",
	}

	local errors = {}
	for _, group in ipairs(snacks_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Snacks highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All snacks highlights defined"
end

-- Test oil highlights
function M.test_oil_highlights()
	local oil_groups = {
		"OilDir",
		"OilFile",
		"OilExecutable",
		"OilNormal",
	}

	local errors = {}
	for _, group in ipairs(oil_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Oil highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All oil highlights defined"
end

-- Test git highlights
function M.test_git_highlights()
	local git_groups = {
		"GitSignsAdd",
		"GitSignsChange",
		"GitSignsDelete",
	}

	local errors = {}
	for _, group in ipairs(git_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Git highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All git highlights defined"
end

-- Ensure key highlight colors match the warm design spec
function M.test_color_alignment(style)
	local expectations_by_style = {
		default = {
			{ "LineNr", { fg = "#F5A97F" } },
			{ "CursorLineNr", { fg = "#FFD8A8" } },
			{ "Pmenu", { bg = "#242635" } },
			{ "PmenuSel", { bg = "#343652" } },
			{ "SnacksPickerTree", { fg = "#3A3D50" } },
			{ "SnacksPickerDirectory", { fg = "#F5A97F", bold = true } },
			{ "SnacksPickerFile", { fg = "#D9DBF2" } },
			{ "SnacksPickerSelected", { bg = "#2B2E3F" } },
		},
		warm = {
			{ "LineNr", { fg = "#E19C60" } },
			{ "CursorLineNr", { fg = "#F2BF8A" } },
			{ "Pmenu", { bg = "#2F3236" } },
			{ "PmenuSel", { bg = "#3A3E43" } },
			{ "SnacksPickerTree", { fg = "#44474B" } },
			{ "SnacksPickerDirectory", { fg = "#E19C60", bold = true } },
			{ "SnacksPickerFile", { fg = "#D2D7D6" } },
			{ "SnacksPickerSelected", { bg = "#34373B" } },
		},
	}

	local expectations = expectations_by_style[style]
	if not expectations then
		return false, ("Unknown style '%s'"):format(style)
	end

	load_theme(style)

	local errors = {}
	for _, item in ipairs(expectations) do
		local group, attrs = item[1], item[2]
		local ok, err = check_hl_group(group, attrs)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Color alignment issues:\n" .. table.concat(errors, "\n")
	end

	return true, "Key colors match the spec"
end

-- Run all tests
function M.run_all_tests()
	print("Running xghost.nvim theme tests...\n")

	local styles = { "default", "warm" }
	local structural_tests = {
		{ name = "Core Highlights", func = M.test_core_highlights },
		{ name = "Bufferline Highlights", func = M.test_bufferline_highlights },
		{ name = "Lualine Highlights", func = M.test_lualine_highlights },
		{ name = "Snacks Highlights", func = M.test_snacks_highlights },
		{ name = "Oil Highlights", func = M.test_oil_highlights },
		{ name = "Git Highlights", func = M.test_git_highlights },
	}

	local passed = 0
	local failed = 0

	for _, style in ipairs(styles) do
		print(("\n== Testing style: %s =="):format(style))
		load_theme(style)

		for _, test in ipairs(structural_tests) do
			local ok, result = test.func()
			local name = ("%s (%s)"):format(test.name, style)
			if ok then
				print(string.format("✓ %s: %s", name, result))
				passed = passed + 1
			else
				print(string.format("✗ %s: %s", name, result))
				failed = failed + 1
			end
		end

		local ok, result = M.test_color_alignment(style)
		local name = ("Color Alignment (%s)"):format(style)
		if ok then
			print(string.format("✓ %s: %s", name, result))
			passed = passed + 1
		else
			print(string.format("✗ %s: %s", name, result))
			failed = failed + 1
		end
	end

	print(string.format("\nTests: %d passed, %d failed, %d total", passed, failed, passed + failed))

	return failed == 0
end

return M
